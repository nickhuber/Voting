class PollQuestionAddWeight < ActiveRecord::Migration
  def self.up
    change_table :polls_questions do |t|
      t.integer :weight, :default => 0
    end
  end

  def self.down
    remove_column :polls_questions, :weight
  end
end
