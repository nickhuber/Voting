class ActivePollsController < ApplicationController
  # GET /active_poll/1
  def show
    @active_poll = ActivePoll.find(params[:id])
  end
  
  # GET /active_poll/1/next
  def next
    @active_poll = ActivePoll.find(params[:id])
    #make the question be the next question
    render :action => :show
  end
end