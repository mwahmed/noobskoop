class AddUserIdToDThreads < ActiveRecord::Migration
  def self.up
    add_column :d_threads, :user_id, :integer
  end

  def self.down
    remove_column :d_threads, :user_id
  end
end
