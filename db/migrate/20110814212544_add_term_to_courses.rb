class AddTermToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :term, :char
  end

  def self.down
    remove_column :courses, :term
  end
end
