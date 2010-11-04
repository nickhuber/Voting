class CreateActivePolls < ActiveRecord::Migration
  def self.up
    create_table :active_polls do |t|
      t.references :poll
      t.references :question
    end
  end

  def self.down
    drop_table :active_polls
  end
end
