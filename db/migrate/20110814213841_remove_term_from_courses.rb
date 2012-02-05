class RemoveTermFromCourses < ActiveRecord::Migration
  def self.up
    remove_column :courses, :term
  end

  def self.down
    add_column :courses, :term, :char
  end
end
