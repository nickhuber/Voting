class ActivePollsController < ApplicationController
  respond_to :html, :json

  # GET /active_polls/1
  def show
    @active_poll = ActivePoll.find(params[:id])
  end
  
  # GET /active_polls/1/next
  def next
    @active_poll = ActivePoll.find(params[:id])
    currentquestion = Pollquestion.current(@active_poll)

    unless (temp = Pollquestion.next(currentquestion)).nil?
      @active_poll.question = temp.question
      @active_poll.save
    end
   
    redirect_to :action => :show
  end
  
  def prev
    @active_poll = ActivePoll.find(params[:id])
    currentquestion = Pollquestion.current(@active_poll)

    unless (temp = Pollquestion.prev(currentquestion)).nil?
      @active_poll.question = temp.question
      @active_poll.save
    end

    redirect_to :action => :show
  end
      
  # GET /aaaa
  def clicker
    # Active poll being accessed.
    @active_poll = ActivePoll.find_by_token(params[:token])
    
    # Check if user is particpating in this poll. 
    if user_session.active_poll != @active_poll
                    
      # Either user hasn't bound to a poll or their session has expired.
      if user_session.active_poll.nil? || !ActivePoll.exists?(user_session.active_poll)
        # Bind session to active poll.
        user_session.active_poll = @active_poll
        
      else
        # Deal with the cheeky user trying to jump ship... (Redirect?)
      end
    end
    respond_to do |format|
      format.html  { render :layout => 'clicker' }
      format.json  { 
                     data = [ 
                             @active_poll, 
                             @active_poll.question, 
                             @active_poll.question.answers 
                            ];
                     respond_with data.to_json 
                   }
    end
  end
  
  # GET /aaaa/submit/
  def clicker_submit
    redirect_to :action => :clicker and return if user_session.participant.nil? #check if the user has a session or not
    
    @active_poll = ActivePoll.find_by_token(params[:token])
    if AnsweredQuestion.exists?({:question_id => @active_poll.question.id, :participant_id => user_session.participant})
      if @active_poll.question.id == Answer.find(params[:answer_id]).question.id
        AnsweredQuestion.find_by_question_id_and_participant_id(@active_poll.question.id, user_session.participant).update_attributes(:answer_id => params[:answer_id])
        flash[:notice] = "Answer updated."
      else
        flash[:notice] = "That question is no longer being presented."
      end
    else
      AnsweredQuestion.new do |a|
        a.question = @active_poll.question
        a.answer = Answer.find(params[:answer_id])
        a.participant_id = user_session.participant
        a.report_id = @active_poll.report_id
        a.save
        flash[:notice]= "Answer submitted."
      end
    end
    respond_to do |format|
      format.html  { render :layout => 'clicker' }
    end
  end
  
  # GET /active_polls/1/end
  def end
    report = ActivePoll.find(params[:id]).report
    ActivePoll.find(params[:id]).delete
    redirect_to report_path(report)
  end
  
end