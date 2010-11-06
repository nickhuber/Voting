class ReportsRemoveAggregates < ActiveRecord::Migration
  def self.up
      remove_column :reports, :agr_num_questions
      remove_column :reports, :agr_num_participants
      remove_column :reports, :agr_avg_score
  end

  def self.down
      change_table :reports do |t|
          t.integer :agr_num_questions
          t.integer :agr_num_participants
          t.float   :agr_avg_score
             
      end
  end
end
