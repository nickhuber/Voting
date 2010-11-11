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
    @active_poll = ActivePoll.find(params[:id])
  end
  
  # GET /1/submit/ANSWERID
  def submit
    @active_poll = ActivePoll.find(params[:id])
    AnsweredQuestion.new do |a|
      a.question = @active_poll.question
      a.answer = params[:answer]
      a.save
    end
  end
end