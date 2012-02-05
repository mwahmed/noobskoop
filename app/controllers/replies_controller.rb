class RepliesController < ApplicationController
	before_filter :load_thread
	
=begin	
	def new
    @r = Reply.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reply }
    end
  end
=end 
	def create
    @r = @t.replies.new(params[:reply])
      if @r.save
        redirect_to @t, :notice => 'Reply posted'

      else
        redirect_to @t, :alert => 'Unable to post reply'
      end
  end
  
  def like_reply
  	@r = Reply.where(:id => params[:replyId]).first	#hashes defined in route for method
		if @rating = DThreadReplyRating.where("user_id = ? AND reply_id = ?", params[:userId] , @r.id).first 
			@rating.likes = 1 if params[:vote] == 'like' 	  
			@rating.likes = -1 if params[:vote] == 'dislike'  
			@rating.save  
	
		else  	
			if params[:vote] == 'like'  
				@r.d_thread_reply_ratings.create(:likes => 1, :user_id => params[:userId])  
			elsif params[:vote] == 'dislike'  
				@r.d_thread_reply_ratings.create(:likes => -1, :user_id => params[:userId])		   
			end  
		end  
			redirect_to :back, :notice => "#{params[:vote]}d"
  end
  
  def destroy
  	@r = @t.replies.find(params[:id])
  	@r.destroy
  	redirect_to @t, :notice => 'Reply deleted'
  end
  
  private
  	def load_thread
  		@t = DThread.find(params[:d_thread_id])
  	end
  
end
