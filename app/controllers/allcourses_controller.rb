class AllcoursesController < ApplicationController
  # GET /allcourses
  # GET /allcourses.xml
  def index
    @allcourses = Allcourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allcourses }
    end
  end

  def course
    @courses = Allcourse.all
    @a = "#{params[:course]}"
    @b = Allcourse.find_by_name("#{params[:course]}")
    @path  = "#{root_path}"+"course/" + "#{params[:course]}"
    unless @b.nil? || @b == 0
      @title = "Courses"
      redirect_to @path
    end
  end

  # GET /allcourses/1
  # GET /allcourses/1.xml
  def show
    @allcourse = Allcourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @allcourse }
    end
  end

  # GET /allcourses/new
  # GET /allcourses/new.xml
  def new
    @allcourse = Allcourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @allcourse }
    end
  end

  # GET /allcourses/1/edit
  def edit
    @allcourse = Allcourse.find(params[:id])
  end

  # POST /allcourses
  # POST /allcourses.xml
  def create
    @allcourse = Allcourse.new(params[:allcourse])

    respond_to do |format|
      if @allcourse.save
        format.html { redirect_to(@allcourse, :notice => 'Allcourse was successfully created.') }
        format.xml  { render :xml => @allcourse, :status => :created, :location => @allcourse }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @allcourse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /allcourses/1
  # PUT /allcourses/1.xml
  def update
    @allcourse = Allcourse.find(params[:id])

    respond_to do |format|
      if @allcourse.update_attributes(params[:allcourse])
        format.html { redirect_to(@allcourse, :notice => 'Allcourse was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @allcourse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /allcourses/1
  # DELETE /allcourses/1.xml
  def destroy
    @allcourse = Allcourse.find(params[:id])
    @allcourse.destroy

    respond_to do |format|
      format.html { redirect_to(allcourses_url) }
      format.xml  { head :ok }
    end
  end
end
