class Poll < ActiveRecord::Base
  validates :title, 
              :presence => true,
              :length => { :minimum => 5 }
  belongs_to :report            
  has_many :questions
end
