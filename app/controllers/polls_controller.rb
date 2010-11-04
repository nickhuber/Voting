class PollsController < ApplicationController
  # GET /polls
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  def show
    @poll = Poll.find(params[:id])
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
    @poll = Poll.find(params[:id])
  end

  # POST /polls
  def create
    @poll = Poll.new(params[:poll])

    if @poll.save
      redirect_to(@poll, :notice => 'Poll was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /polls/1
  def update
    @poll = Poll.find(params[:id])

    if @poll.update_attributes(params[:poll])
      redirect_to(@poll, :notice => 'Poll was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /polls/1
  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy

    redirect_to(polls_url)
  end
  
  # GET polls/1/present
  def present
    @poll = Poll.find(params[:id])
    @active_poll = ActivePoll.new do |a|
      a.poll_id = @poll
      a.question_id = @poll.questions.first
      #a.question = @poll.questions.first
    end
    
    if @active_poll.save
      redirect_to(@poll, :notice => 'Poll is now active for polling.')
    else
      render :action => "show"
    end
  end
end
