class AddCourseCodeToDThreads < ActiveRecord::Migration
  def self.up
    add_column :d_threads, :courseCode, :string
  end

  def self.down
    remove_column :d_threads, :courseCode
  end
end
