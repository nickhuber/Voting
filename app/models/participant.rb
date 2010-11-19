class Participant < ActiveRecord::Base
  has_one :report
  
  has_many :answered_questions
end
