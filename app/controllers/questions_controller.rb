class QuestionsController < ApplicationController

  # GET polls/1/questions
  def index
    @poll = Poll.find(params[:poll_id])
    @questions = @poll.questions.all
  end

  # GET polls/1/questions/1
  def show
 #   @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
  end

  # GET polls/1/questions/new
  def new
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build
  end

  # GET polls/1/questions/1/edit
  def edit
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.find(params[:id])
  end

  # POST polls/1/questions
  def create
    @poll = Poll.find(params[:poll_id])
    @poll.questions.create
    @question = @poll.questions.build(params[:question])
    
    if @question.save
      redirect_to(@question, :notice => 'Question was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT polls/1/questions/1
  def update
    @question = Question.find(params[:id])
    @poll = Poll.find(params[:poll_id])

    if @question.update_attributes(params[:question])
      redirect_to(@question, :notice => 'Question was successfully updated.')
    else
      render :action => "edit" 
    end
  end

  # DELETE polls/1/questions/1
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end
end
