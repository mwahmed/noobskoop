class DThread < ActiveRecord::Base
#DThread has members: title, id , course_id, author, question, courseCode, created_at, updated_at
	
	validates :title, :presence => true, 
										:length => {:within => 1..100}
	
	validates :question, :presence => true,
											 :uniqueness => true
											  
	validates :courseCode, :presence => true, 
											 	 :format => { :with => /[a-zA-Z]+[a-zA-Z]+[a-zA-Z]+[1-5]+[0-9]{2}/i }  #regex for course code of the form 'ece216'
	
#	validate :course_exists
	validate :verify_course
	
	belongs_to :course
	has_many :replies
	has_many :tags
	belongs_to :user
	has_many :d_thread_ratings
	 
	before_save :verify_course , :verify_tags, :verify_user
	after_save	:create_tags
	
	def verify_course
		course_code = self.courseCode
		if c = Course.where(:courseCode => course_code)[0] 
			self.course_id = c.id
			return true
		elsif course_code.size == 6
			if c = Course.where(:courseCode => course_code + 'H1')[0] 
				self.course_id = c.id
				self.courseCode = course_code + 'H1'
				return true
			elsif c = Course.where(:courseCode => course_code + 'Y1')[0] 
				self.course_id = c.id
				self.courseCode = course_code + 'Y1'
				return true
			end
		elsif course_code.size == 8
			if c = Course.where(:courseCode => course_code[0..-3])[0]
				self.course_id = c.id
				self.courseCode = course_code[0..-3]
				return true
			end
		end
		errors.add(:courseCode, "Course #{courseCode} doesn't exist") 
		return false
	end
	

	def verify_tags
		if self.tg  #BUG, SHOULD NOT NEED THIS IF STATEMENT
			tags = self.tg.split(/[\s,;]/) #verify number of , and appropriateness of tags	
			if tags.size == 0
				errors.add(:tg, "No tags")
				return false
			elsif tags.size > 5
				errors.add(:tg, "Too many tags") 
				return false
			else
				tags.each do |t|				
					if t =~ /[^0-9a-zA-Z+-_]/
						errors.add(:tags, "Inappropriate Tag") 
						return false
					end	
				end
			end		
			return true
		end
		else 
			return false
	end
	
	def create_tags
		tags = self.tg.split(/[\s,;]/) #don't need to do any error checking - done in verify_tags
		tags.each do |t|
		  Tag.create(:name => t, :d_thread_id => self.id) unless t == ""
		end
	end
	
	def verify_user
    if $glo#@currentUser#||= User.authenticate_with_salt(*remember_token)
    	self.user_id = $glo
		else
			errors.add(:user_id, "User not verified")
			return false
		end
	end
	
=begin
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
=end	

end
