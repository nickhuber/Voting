class ActivePoll < ActiveRecord::Base
  belongs_to :poll
  belongs_to :question
  belongs_to :report
  belongs_to :user_session
  
  before_save :generate_token
  
  def generate_token    
    o = [('a'..'z')].map{|i| i.to_a}.flatten;  
    token = (0..3).map{ o[rand(o.length)]  }.join;
    until not ActivePoll.exists?(["token = ?", token.to_s])
      o = [('a'..'z')].map{|i| i.to_a}.flatten;  
      token = (0..3).map{ o[rand(o.length)]  }.join;
      puts token
    end
    self.token = token
  end
end
