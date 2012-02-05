class AddKernelToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :kernel, :string
  end

  def self.down
    remove_column :courses, :kernel
  end
end
