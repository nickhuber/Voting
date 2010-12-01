class ReportsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json

  # GET /reports
  # GET /reports.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

# TO BE IMPLEMENTED
  #def question
  #  answers = Array.new
  #  @report.poll.questions.each_with_index do |q, i|
  #      answers[i] = Array.new
  #      q.answers.each do |a|
  #         answers[i] << a.body
  #      end
  #  end 
  #end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])
    correct_questions = Array.new
    # get the correct questions into the array
    @report.poll.questions.each do |q|
        correct_questions << AnsweredQuestion.num_correct(q)
    end
       data = [ 
        @report.participants.count,
        @report.poll.questions.count,
        correct_questions
       ];
       respond_with data.to_json
  end

  # GET /reports/new
  # GET /reports/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.xml
  def create
    respond_to do |format|
      if @report.save
        format.html { redirect_to(@report, :notice => 'Report was successfully created.') }
        format.xml  { render :xml => @report, :status => :created, :location => @report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
  def update
    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to(@report, :notice => 'Report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
       
    
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end
end
