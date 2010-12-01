class AddTokenToActivepoll < ActiveRecord::Migration
  def self.up
    change_table :active_polls do |t|
      t.string :token
    end
  end

  def self.down
      remove_column :active_polls, :token
  end
end
