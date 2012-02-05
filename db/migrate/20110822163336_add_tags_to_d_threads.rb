class AddTagsToDThreads < ActiveRecord::Migration
  def self.up
    add_column :d_threads, :tags, :string
  end

  def self.down
    remove_column :d_threads, :tags
  end
end
