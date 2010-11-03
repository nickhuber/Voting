class PollsQuestions < ActiveRecord::Migration
  def self.up
    create_table :polls_questions, :id => false do |t|
      t.integer :poll_id
      t.integer :question_id
    end
  end

  def self.down
    drop_table :polls_questions
  end
end
