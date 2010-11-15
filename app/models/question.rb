class Question < ActiveRecord::Base
  has_many :pollquestions
  has_many :polls, :through => :pollquestions
  has_many :answers
  has_many :active_polls
  
  accepts_nested_attributes_for :answers
  validate :length => {:min => 5}
  
  def answer_attributes=(answer_attributes)
    answer_attributes.each do |attributes|
      answers.build(attributes)
    end
  end
end
