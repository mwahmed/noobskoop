class Course < ActiveRecord::Base
# Course has members title, courseCode	

	has_many :d_threads, :dependent => :destroy
	#belongs_to :year
	
	validates :courseCode, :uniqueness => true
	validates :title, :uniqueness => true

	acts_as_simply_searchable :columns => :name
end
