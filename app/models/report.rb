class Report < ActiveRecord::Base
	belongs_to :poll
	has_many :participants
	has_many :answered_questions
end
