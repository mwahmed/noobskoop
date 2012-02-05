class Ece < ActiveRecord::Base
	validates :course_code, :uniqueness => true
	
	acts_as_simply_searchable :columns => :name

	
end
