class Pollquestion < ActiveRecord::Base
  belongs_to :poll
  belongs_to :question
  before_save :default_values
  
  def default_values
    self.weight = '0' unless self.weight
  end
  
  def self.current(ap)
    where("poll_id = ? AND question_id = ?", ap.poll_id, ap.question_id).first
  end
  
  def self.next(q)
    where("weight > ?", q.weight).limit(1).order("weight ASC").first
  end
  
  def self.prev(q)
    where("weight < ?", q.weight).limit(1).order("weight DESC").first
  end
end
