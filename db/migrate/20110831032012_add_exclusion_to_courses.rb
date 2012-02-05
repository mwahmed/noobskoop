class AddExclusionToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :exclusion, :string
  end

  def self.down
    remove_column :courses, :exclusion
  end
end
