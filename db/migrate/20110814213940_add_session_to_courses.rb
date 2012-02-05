class AddSessionToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :session, :char
  end

  def self.down
    remove_column :courses, :session
  end
end
