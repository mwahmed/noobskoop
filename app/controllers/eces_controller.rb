class EcesController < ApplicationController
  # GET /eces
  # GET /eces.xml
  def index
    @eces = Ece.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @eces }
    end
  end

  def course

    @courses = Ece.all
    @a = "#{params[:course]}"
    $b = Ece.find_by_course_code("#{params[:course]}")



    unless $b.nil? || $b == 0
 	    @c = $b.id
    @path  = "#{root_path}"+"eces/" + "#{@c}"
      @title = "Courses"
      redirect_to @path
    end
  end

	def ece
		@title="ECE"
	end
 

  # GET /eces/1
  # GET /eces/1.xml
  def show
    @ece = Ece.find(params[:id])
    @path = Course.where(:courseCode => @ece.course_code).first   #don't check if nil, because if nil, link doesn't work and no error 
=begin
    @course=Course.all
    if !$b.nil?
    @ccc=$b.course_code
    @path = "/courses/#{Course.find_by_courseCode(@ccc).id}"
    end
=end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ece }
    end
  end

  # GET /eces/new
  # GET /eces/new.xml
  def new
    @ece = Ece.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ece }
    end
  end

  # GET /eces/1/edit
  def edit
    @ece = Ece.find(params[:id])
  end

  # POST /eces
  # POST /eces.xml
  def create
    @ece = Ece.new(params[:ece])

    respond_to do |format|
      if @ece.save
        format.html { redirect_to(@ece, :notice => 'Ece was successfully created.') }
        format.xml  { render :xml => @ece, :status => :created, :location => @ece }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eces/1
  # PUT /eces/1.xml
  def update
    @ece = Ece.find(params[:id])

    respond_to do |format|
      if @ece.update_attributes(params[:ece])
        format.html { redirect_to(@ece, :notice => 'Ece was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eces/1
  # DELETE /eces/1.xml
  def destroy
    @ece = Ece.find(params[:id])
    @ece.destroy

    respond_to do |format|
      format.html { redirect_to(eces_url) }
      format.xml  { head :ok }
    end
  end
end
