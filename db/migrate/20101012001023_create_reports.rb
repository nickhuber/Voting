class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :id
      t.integer :agr_num_questions
      t.integer :agr_num_participants
      t.float :agr_avg_score
      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
