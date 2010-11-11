class Report < ActiveRecord::Base
	belongs_to :poll
	has_many :participants
end
