class AddReportIdToActivePolls < ActiveRecord::Migration
  def self.up
    change_table :active_polls do |t|
      t.references :report
    end
  end

  def self.down
    remove_column :active_polls, :report
  end
end
