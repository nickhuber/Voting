class AnswersController < ApplicationController
  # GET /question/1/answers
  def index
    @question = Questions.find(params[:question_id])
  end

  # GET /question/1/answers/1
  def show
    @answer = Answer.find(params[:id])
  end

  # GET /question/1/answers/new
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build
  end

  # GET /question/1/answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /question/1/answers
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
    
    # This looks hacky
    @answer.question_id = @question.id

    if @answer.save
      redirect_to(@answer, :notice => 'Answer was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /question/1/answers/1
  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params[:answer])
      redirect_to(@answer, :notice => 'Answer was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /question/1/answers/1
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
  end
end
