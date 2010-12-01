class Answer < ActiveRecord::Base
  belongs_to :question
  
  validates_presence_of :body, :message => "Answer cannot be blank."
  
  attr_accessor :should_destroy
  
  def should_destroy?
    should_destroy.to_i == 1
  end
  
  # returns the number of people that picked this answer for the report parameter
  def picked(report)
    report.answered_questions.find_all_by_answer_id(self.id).count
  end
end
