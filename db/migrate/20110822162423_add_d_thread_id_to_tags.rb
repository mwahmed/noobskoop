class AddDThreadIdToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :d_thread_id, :integer
  end

  def self.down
    remove_column :tags, :d_thread_id
  end
end
