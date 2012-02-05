class AddYearIdToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :year_id, :integer
  end

  def self.down
    remove_column :courses, :year_id
  end
end
