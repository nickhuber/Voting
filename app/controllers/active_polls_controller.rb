class ActivePollsController < ApplicationController
  # GET /active_poll/1
  def show
    @active_poll = ActivePoll.find(params[:id])
  end
end