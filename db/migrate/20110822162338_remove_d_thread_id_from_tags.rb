class RemoveDThreadIdFromTags < ActiveRecord::Migration
  def self.up
    remove_column :tags, :d_thread_id
  end

  def self.down
    add_column :tags, :d_thread_id, :string
  end
end
