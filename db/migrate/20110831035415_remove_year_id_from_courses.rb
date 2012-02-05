class RemoveYearIdFromCourses < ActiveRecord::Migration
  def self.up
    remove_column :courses, :year_id
  end

  def self.down
    add_column :courses, :year_id, :integer
  end
end
