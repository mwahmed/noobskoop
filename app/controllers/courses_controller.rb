class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.xml
  def index
    @courses = Course.all
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @c = @course = Course.find(params[:id])
		@t = DThread.where(:courseCode => @c.courseCode)
		@t = @t.sort! { |a,b| a.created_at <=> b.created_at }
		@t = @t[0..4] #Have 5 last published
		#@current_C = current_course
		 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

    def course

    @courses = Course.all
    @a = "#{params[:course]}"
    $b = Course.find_by_courseCode("#{params[:course]}")

    if $b.nil?
	$b = Course.find_by_courseCode("#{params[:course]}"+"H1")
    elsif $b.nil?
	$b = Course.find_by_courseCode("#{params[:course]}"+"Y1")
    end 
   unless $b.nil? || $b == 0
 	    @c = $b.id
  
    @path  = "#{root_path}"+"courses/" + "#{@c}"
      @title = "Courses"
      redirect_to @path
    end
  end


#Rest of the actions are useless, since user can't add/remove courses

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to(@course, :notice => 'Course was successfully created.') }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to(@course, :notice => 'Course was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id]) 
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end
  
  def course_description
  	@c = Course.where(:courseCode =>(params[:id])).first 
  	Course.column_names.each do |n| #replace all nil fields with '-'
  		@c[n] = "-" unless @c[n] 
  	end
  	@areaNames = []
  	if @c.discipline =='ECE'
  		@areaNames <<'Area 1: Photonics & Semiconductor Physics' <<'Area 2: Electromagnetics & Energy Systems' << 'Area 3: Analog and Digital Electronics' <<'Area 4: Control, Communication & Signal Processing' << 'Area 5: Computer Hardware & Computer Networks' << 'Area 6: Software'<<'Area 7: Science/Math'
  	end 
  	respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end
end
