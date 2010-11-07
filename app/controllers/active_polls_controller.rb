class ActivePollsController < ApplicationController
  # GET /active_polls/1
  def show
    @active_poll = ActivePoll.find(params[:id])
  end
  
  # GET /active_polls/1/next
  def next
    @active_poll = ActivePoll.find(params[:id])
    #make the question be the next question
    render :action => :show
  end
  
  # GET /1
  def clicker
    @active_poll = ActivePoll.find(params[:id])
  end
end