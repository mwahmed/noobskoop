class AddCourseCodeToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :courseCode, :string
  end

  def self.down
    remove_column :courses, :courseCode
  end
end
