class ActivePoll < ActiveRecord::Base
  belongs_to :poll
  belongs_to :question
  belongs_to :report
  belongs_to :user_session
  
  before_create :generate_token
  
  def generate_token    
    o = [('a'..'z')].map{|i| i.to_a}.flatten;  
    token = (0..3).map{ o[rand(o.length)]  }.join;
    while ActivePoll.exists?(["token = ?", token.to_s])
      o = [('a'..'z')].map{|i| i.to_a}.flatten;  
      token = (0..3).map{ o[rand(o.length)]  }.join;
    end
    self.token = token
  end
end
