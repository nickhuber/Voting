class QuestionsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js
  
  # GET questions
  def index
    @poll = Poll.find(params[:poll_id])
    @poll_questions = @poll.questions.all
    @remaining_questions = @questions - @poll_questions
  end

  # GET questions/1
  def show    
  end

  # GET polls/1/questions/new
  def new
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build
    
    num_answers = 4
    
    num_answers.times { @question.answers.build }
  end

  # GET polls/1/questions/1/edit
  def edit
  end

  # POST polls/1/questions
  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.create(params[:question])

    if @question.save
      highest_weight = Pollquestion.find_all_by_poll_id(params[:poll_id]).max { |a, b| a.weight <=> b.weight }.weight + 1
      Pollquestion.find_by_poll_id_and_question_id(@poll.id, @question.id).update_attributes(:weight => highest_weight)
      redirect_to(@poll, :notice => 'Question was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT polls/1/questions/1
  def update
    if params[:poll]
      @destination = polls_path(params[:poll])
    else
      @destination = @question
    end
    
    if @question.update_attributes(params[:question])
      redirect_to(@destination, :notice => 'Question was successfully updated.')
    else
      render :action => "edit" 
    end
  end
  
  # PUT polls/1/questions/1/add
  def add_to_poll
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:q_id])
    @poll.questions << @question
    respond_with @poll, @questionjquery ho to unhide
  end
  
  # PUT polls/1/questions/1/remove
  def remove_from_poll
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:q_id]);
    @poll.questions.delete(@question)
    respond_with @poll, @question
  end
  
  # DELETE polls/1/questions/1
  def destroy
    @question.destroy
  end
end
