class AddCoursecodeToEces < ActiveRecord::Migration
  def self.up
    add_column :eces, :course_code, :string
  end

  def self.down
    remove_column :eces, :course_code
  end
end
