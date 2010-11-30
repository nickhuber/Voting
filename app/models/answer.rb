class Answer < ActiveRecord::Base
  belongs_to :question
  
  validates_presence_of :body, :message => "Answer cannot be blank."
  
  attr_accessor :should_destroy
  
  def should_destroy?
    should_destroy.to_i == 1
  end
end
