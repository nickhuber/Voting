class RemovePollsQuestions < ActiveRecord::Migration
  def self.up
    drop_table "polls_questions"
  end

  def self.down
    create_table :polls_questions, :id => false do |t|
      t.integer :poll_id
      t.integer :question_id
      t.integer :weight
    end
  end
end
