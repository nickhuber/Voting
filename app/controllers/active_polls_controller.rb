class ActivePollsController < ApplicationController  
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
  end
  
  # GET /1/submit/
  def submit
    @active_poll = ActivePoll.find(params[:id])
    AnsweredQuestion.new do |a|
      a.question = @active_poll.question
      a.answer = Answer.find(params[:answer]) #TODO: make sure this answer fits this question., ALSO, make sure we dont have duplicate submissions from each user
      a.save
    end
    redirect_to :action => :clicker
  end
end