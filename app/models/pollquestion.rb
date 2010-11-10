class Pollquestion < ActiveRecord::Base
  belongs_to :poll
  belongs_to :question
end
