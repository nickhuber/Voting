class Answer < ActiveRecord::Base
  belongs_to :question
  
  validates :body, :presence => true
  
  attr_accessor :should_destroy
  
  def should_destroy?
    should_destroy.to_i == 1
  end
end
