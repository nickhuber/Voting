class Poll < ActiveRecord::Base
  validates :title, 
              :presence => true,
              :length => { :minimum => 5 }
            
  has_many :questions
end
