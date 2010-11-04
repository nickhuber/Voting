class ActivePoll < ActiveRecord::Base
  has_one :poll
  belongs_to :report
end
