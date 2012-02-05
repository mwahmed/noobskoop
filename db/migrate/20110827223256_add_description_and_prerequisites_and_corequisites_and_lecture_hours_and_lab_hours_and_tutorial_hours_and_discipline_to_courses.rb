class AddDescriptionAndPrerequisitesAndCorequisitesAndLectureHoursAndLabHoursAndTutorialHoursAndDisciplineToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :description, :text
    add_column :courses, :prerequisites, :string
    add_column :courses, :corequisites, :string
    add_column :courses, :lectureHours, :float
    add_column :courses, :labHours, :float
    add_column :courses, :tutorialHours, :float
    add_column :courses, :discipline, :string
  end

  def self.down
    remove_column :courses, :discipline
    remove_column :courses, :tutorialHours
    remove_column :courses, :labHours
    remove_column :courses, :lectureHours
    remove_column :courses, :corequisites
    remove_column :courses, :prerequisites
    remove_column :courses, :description
  end
end
