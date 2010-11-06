class AddUserSessionToParticipants < ActiveRecord::Migration
  def self.up
    add_column :participants, :user_session, :string
  end

  def self.down
    remove_column :participants, :user_session
  end
end
