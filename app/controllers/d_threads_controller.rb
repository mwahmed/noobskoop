class DThreadsController < ApplicationController

	def index
    @t = DThread.all
    @d_threads = DThread.paginate(:page => params[:page])
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @d_threads }
    end
  end
  
  
  # GET /d_threads/1
  # GET /d_threads/1.xml
  def show
    @t = DThread.find(params[:id])
    @id = @t.user_id
    @uss = User.find_by_id("#{@id}") 				
		@crs = 	Course.find_by_courseCode(@t.courseCode)
		@path = ''
		@tg = Tag.where(:d_thread_id => @t.id)
		$CURRENT_DTHREAD = @t.id
		@u = $CURRENT_USER
		
		if @crs
			@path = '/courses/' + @crs.id.to_s() 
    else
    	@path = '/courses/'
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @d_thread }
    end
  end
	
	def like_d_thread
		@d = DThread.where(:id => params[:dThreadId]).first	#hashes defined in route for method
		if @rating = DThreadRating.where("user_id = ? AND d_thread_id = ?", params[:userId] , @d.id).first 
			@rating.likes = 1 if params[:vote] == 'like' 	  
			@rating.likes = -1 if params[:vote] == 'dislike'  
			@rating.save  
	
		else  	
			if params[:vote] == 'like'  
				@d.d_thread_ratings.create(:likes => 1, :user_id => params[:userId])  
			elsif params[:vote] == 'dislike'  
				@d.d_thread_ratings.create(:likes => -1, :user_id => params[:userId])		   
			end  
		end  
			redirect_to :back, :notice => "#{params[:vote]}d"	
	end
			
			
	def search
	 $result = DThread.where("title like ? OR question like ?", "%" + params[:query] + "%", "%" + params[:query] + "%") 
	end
	
	def new
		respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @d_thread }
    end		
  end

	def post
		@t = DThread.new
    respond_to do |format|
      format.html # post.html.erb
      format.xml  { render :xml => @d_thread }
    end
	end
	
	# GET /d_threads/1/edit
  def edit
    @t = DThread.find(params[:id])
  end

  # POST /d_threads
  # POST /d_threads.xml
  def create
    @t = DThread.new(params[:d_thread])

    respond_to do |format|
      if @t.save
        format.html { redirect_to(@t, :notice => 'Thread was successfully created.') }
        format.xml  { render :xml => @t, :status => :created, :location => @t }
      else
        format.html { render :action => "post" }
        format.xml  { render :xml => @t.errors, :status => :unprocessable_entity }
      end
    end
  end

	def tag

    @a = "#{params[:course]}"
    @tt = Tag.find_by_name("#{params[:course]}")

   unless @tt.nil? || @tt == 0
 	    @c = @tt.id
    @path  = "#{root_path}"+"tags/" + "#{@c}"
      @title = "Tags"
      redirect_to @path
    end
  end
	
	
  # PUT /d_threads/1
  # PUT /d_threads/1.xml
  def update
    @t = DThread.find(params[:id])

    respond_to do |format|
      if @t.update_attributes(params[:d_thread])
        format.html { redirect_to(@course, :notice => 'Course was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @t.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /d_threads/1
  # DELETE /d_threads/1.xml
  def destroy
    @t = DThread.find(params[:id])
    @t.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end

end
