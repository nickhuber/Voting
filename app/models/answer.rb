class Answer < ActiveRecord::Base
  belongs_to :question
  validate :length => {:min => 5}
end
