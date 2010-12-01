class AddReportToAnsweredQuestions < ActiveRecord::Migration
  def self.up
    change_table :answered_questions do |t|
      t.references :report
    end
  end

  def self.down
    remove_column :answered_questions, :report_id
  end
end
