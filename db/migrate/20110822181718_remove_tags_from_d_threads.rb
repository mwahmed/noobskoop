class RemoveTagsFromDThreads < ActiveRecord::Migration
  def self.up
    remove_column :d_threads, :tags
  end

  def self.down
    add_column :d_threads, :tags, :string
  end
end
