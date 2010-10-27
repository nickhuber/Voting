class Poll < ActiveRecord::Base
  validates :title, 
              :presence => true,
              :length => { :minimum => 5 }
  belongs_to :report                        
  has_and_belongs_to_many :questions
end
