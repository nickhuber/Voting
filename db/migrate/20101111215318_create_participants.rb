class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.references :report
    end
  end

  def self.down
    drop_table :participants
  end
end
