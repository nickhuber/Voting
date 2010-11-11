class CreateAnsweredQuestions < ActiveRecord::Migration
  def self.up
    create_table :answered_questions do |t|
      t.references :particant
      t.references :question
      t.references :answer
    end
  end

  def self.down
    drop_table :answered_questions
  end
end
