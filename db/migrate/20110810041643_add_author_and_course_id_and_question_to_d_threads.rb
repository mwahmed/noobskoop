class AddAuthorAndCourseIdAndQuestionToDThreads < ActiveRecord::Migration
  def self.up
    add_column :d_threads, :author, :string
    add_column :d_threads, :course_id, :integer
    add_column :d_threads, :question, :text
  end

  def self.down
    remove_column :d_threads, :question
    remove_column :d_threads, :course_id
    remove_column :d_threads, :author
  end
end
