class QuestionsRemovePollsReference < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      remove_column :questions, :poll_id
    end
  end

  def self.down
    change_table :answers do |t|
      t.references :poll
    end
  end
end
