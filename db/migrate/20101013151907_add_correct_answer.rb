class AddCorrectAnswer < ActiveRecord::Migration
  def self.up
    change_table :answers do |t|
      t.boolean :correct, :default => false
    end
    Answer.update_all ["correct = false"]
  end

  def self.down
    remove_column :answers, :correct
  end
end
