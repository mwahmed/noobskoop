class AddAreaNameToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :areaName, :string
  end

  def self.down
    remove_column :courses, :areaName
  end
end
