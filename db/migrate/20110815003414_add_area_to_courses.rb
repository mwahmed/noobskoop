class AddAreaToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :area, :integer
  end

  def self.down
    remove_column :courses, :area
  end
end
