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
    next_question = where("weight > ? AND poll_id = ?", q.weight, q.poll_id).order("weight ASC").first 
  end
  
  def self.prev(q)
    prev_question = where("weight < ? AND poll_id = ?", q.weight, q.poll_id).order("weight DESC").first
  end
end
