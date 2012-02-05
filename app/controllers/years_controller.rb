class YearsController < ApplicationController

	# GET /years
  # GET /years.xml
  def index
    @y = Year.all
		@c1F = Course.where("year_id = '1' AND session = 'F'" )    
    @c1S = Course.where("year_id = '1' AND session = 'S'" )
    @c2F = Course.where("year_id = '2' AND session = 'F'" )    
    @c2S = Course.where("year_id = '2' AND session = 'S'" )
    
  
    @cU1F = Course.where("(year_id > '2') AND (area = '1' OR (area > 11 AND area <200)) AND (session = 'F' OR 'B')")
    @cU1S = Course.where("(year_id > '2') AND (area = '1' OR (area > 11 AND area <17)) AND (session = 'S')") 
    @cU2F = Course.where("(year_id > '2') AND (area = '2' OR (area > 21 AND area <27)) AND (session = 'F' OR 'B')")
    @cU2S = Course.where("(year_id > '2') AND (area = '2' OR (area > 21 AND area <27)) AND (session = 'S')")
    @cU3F = Course.where("(year_id > '2') AND (area = '3' OR (area > 31 AND area <37)) AND (session = 'F' OR 'B')")
    @cU3S = Course.where("(year_id > '2') AND (area = '3' OR (area > 31 AND area <37)) AND (session = 'S')") 
    @cU4F = Course.where("(year_id > '2') AND (area = '4' OR (area > 41 AND area <47)) AND (session = 'F' OR 'B')")
    @cU4S = Course.where("(year_id > '2') AND (area = '4' OR (area > 41 AND area <47)) AND (session = 'S')")
    @cU5F = Course.where("(year_id > '2') AND (area = '5' OR (area > 51 AND area <57)) AND (session = 'F' OR 'B')")
    @cU5S = Course.where("(year_id > '2') AND (area = '5' OR (area > 51 AND area <57)) AND (session = 'S')") 
    @cU6F = Course.where("(year_id > '2') AND (area = '6' OR (area > 61 AND area <67)) AND (session = 'F' OR 'B')")
    @cU6S = Course.where("(year_id > '2') AND (area = '6' OR (area > 61 AND area <67)) AND (session = 'S')")
    @cU7F = Course.where("(year_id > '2') AND (area = '7' OR (area > 71 AND area <77)) AND (session = 'F' OR 'B')")
    @cU7S = Course.where("(year_id > '2') AND (area = '7' OR (area > 71 AND area <77)) AND (session = 'S')")
    
    @cUF = []
		@cUF << @cU1F << @cU2F << @cU3F  << @cU4F  << @cU5F  << @cU6F  << @cU7F
		@cUS = []    
    @cUS << @cU1S << @cU2S << @cU3S  << @cU4S  << @cU5S  << @cU6S  << @cU7S
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @y }
    end
  end
  
  # GET /years/1
  # GET /years/1.xml
  def show
  	@y = params[:id]
		@d = DThread.all
		@s = -1 + @d.size 
		while @s >= 0		
			if @d[@s].courseCode[3] !=  @y
				@d.delete_at(@s)
			end
			@s -=1
		end
				
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @y }
    end
  end
  
  def areaShow
  	
  	@a = Integer(params[:id])
  	
  	if @a > 7 #if user trying to access area >7 page, redirect them to main page
  		redirect_to ('/years')
  		return true
  	end
  	
  	@d = DThread.all
  	@s = -1 + @d.size
  
  	while @s >= 0 
				if ((@d[@s].courseCode[0] == 'E') && (@d[@s].courseCode[3] < '3'))  #delete 100, 200 ECE courses
					@d.delete_at(@s)                                                
				else	
					c = Course.where(:courseCode => @d[@s].courseCode).first # find matching course
					if c.area != @a                   
						@d.delete_at(@s)
  				end
  			end
  		@s -= 1
  	end	
  	
  	respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @a }
  	end
  end

end
