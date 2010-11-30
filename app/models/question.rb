class Question < ActiveRecord::Base
  has_many :pollquestions
  has_many :polls, :through => :pollquestions
  has_many :answers
  has_many :active_polls
  
  after_update :save_answers
  
  validates_presence_of :body, :message => "Question cannot be blank."
  validates_associated :answers
  
  def answer_attributes=(answer_attributes)
    answer_attributes.each do |attributes|
      if attributes[:id].blank?
        answers.build(attributes)
      else
        answer = answers.detect { |a| a.id == attributes[:id].to_i }
        answer.attributes = attributes
      end
    end
  end
  
  def save_answers
    answers.each do |a|
      if a.should_destroy?
        a.destroy
      else
        a.save(false) #ignore validation, is handled by a question
      end
    end
  end
    
end
