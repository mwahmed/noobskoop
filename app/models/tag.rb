class Tag < ActiveRecord::Base

	belongs_to :d_thread
	
	validates :d_thread_id, :presence => true
	validates :name, :presence => true
	
end
