class ActivePoll < ActiveRecord::Base
  belongs_to :poll
  belongs_to :question
  has_one    :report
end
