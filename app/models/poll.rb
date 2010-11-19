class Poll < ActiveRecord::Base
  validates :title, 
              :presence => true,
              :length => { :minimum => 5 }
  has_many :reports
  has_many :pollquestions 
  has_many :questions, :through => :pollquestions
end
