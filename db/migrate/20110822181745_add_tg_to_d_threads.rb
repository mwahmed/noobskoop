class AddTgToDThreads < ActiveRecord::Migration
  def self.up
    add_column :d_threads, :tg, :string
  end

  def self.down
    remove_column :d_threads, :tg
  end
end
