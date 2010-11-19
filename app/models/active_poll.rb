class ActivePoll < ActiveRecord::Base
  belongs_to :poll
  belongs_to :question
  belongs_to :report
end
