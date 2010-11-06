class ActivePoll < ActiveRecord::Base
  belongs_to :poll
  belongs_to :question
  belongs_to :report
  belongs_to :user_session
end
