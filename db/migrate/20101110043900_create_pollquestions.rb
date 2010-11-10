class CreatePollquestions < ActiveRecord::Migration
  def self.up
    create_table :pollquestions do |t|
      t.references :poll
      t.references :question
      t.integer :weight
    end
  end

  def self.down
    drop_table :pollquestions
  end
end
