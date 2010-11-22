class ActivePollsController < ApplicationController
  respond_to :html, :json
  layout "clicker", :only => [:clicker]
  
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
      
  # GET /1
  def clicker
    # Active poll being accessed.
    @active_poll = ActivePoll.find(params[:id])
    
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
    data = [ 
      @active_poll, 
      @active_poll.question,
      @active_poll.question.answers
    ];
    respond_with data.to_json
  end
  
  # GET /1/submit/
  def submit
    redirect_to :action => :clicker and return if user_session.participant.nil? #check if the user has a session or not
    
    @active_poll = ActivePoll.find(params[:id])
    if AnsweredQuestion.exists?({:question_id => @active_poll.question.id, :participant_id => user_session.participant})
      if @active_poll.question.id == Answer.find(params[:answer]).question.id
        AnsweredQuestion.find_by_question_id_and_participant_id(@active_poll.question.id, user_session.participant).update_attributes(:answer_id => params[:answer])
        flash[:notice] = "Answer updated."
      else
        flash[:notice] = "That question is no longer being presented."
      end
    else
      AnsweredQuestion.new do |a|
        a.question = @active_poll.question
        a.answer = Answer.find(params[:answer])
        a.participant_id = user_session.participant
        a.save
        flash[:notice]= "Answer submitted."
      end
    end
    redirect_to :action => :clicker
  end
end