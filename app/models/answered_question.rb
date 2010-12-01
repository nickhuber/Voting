class AnsweredQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  
  belongs_to :participant
  
  def self.num_correct(q, r)
    where("answered_questions.question_id = ? AND answers.correct = true AND report_id = ?", q.id, r.id).joins(:answer).count
  end
end
