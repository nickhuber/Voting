class Poll < ActiveRecord::Base
  validates :title, 
              :presence => true,
              :length => { :minimum => 5 }
  belongs_to :report
  has_many :pollquestions 
  has_many :questions, :through => :pollquestions
end
