class AddAntiDescriptionToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :antiDescription, :text
  end

  def self.down
    remove_column :courses, :antiDescription
  end
end
