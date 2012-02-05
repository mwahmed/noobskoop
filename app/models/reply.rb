class Reply < ActiveRecord::Base
# Reply has members author, body	
	
	#validates :author, :presence => true
	validates :body, :presence => true 
											
	belongs_to :d_thread
	has_many :d_thread_reply_ratings 

	before_save :verify_user
	
	def verify_user
    if $CURRENT_USER	
	  	self.user_id = $CURRENT_USER
	  	if self.author =~/[^a-zA-Z\s]/
	  		errors.add(:author, "Enter a valid name")
	  		return false
	  	end	
	  	self.author = User.find($CURRENT_USER).name 
	  elsif self.author.nil? || self.author == ""
	  	errors.add(:author, "Please enter your name")
	  	return false 		
		end
	end
	
end
