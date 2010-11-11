class Participant < ActiveRecord::Base
  belongs_to :report
  
  has_many :answered_questions
end
