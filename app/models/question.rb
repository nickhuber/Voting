class Question < ActiveRecord::Base
  has_many :pollquestions
  has_many :polls, :through => :pollquestions
  has_many :answers
  
  has_many :active_polls
end
