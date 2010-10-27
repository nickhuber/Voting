class AddFieldnameToReports < ActiveRecord::Migration
  def self.up
	change_table :reports do |t|
		t.references :poll
	end
  end

  def self.down
    remove_column :reports, :poll
  end
end
