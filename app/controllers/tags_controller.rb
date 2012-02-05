class TagsController < ApplicationController
	class Tgs
		def initialize(n, l) 
			@name = n
			@list = l
		end
		
		def getName
			return @name
		end
		def getList
			return @list
		end
		def setName(n)
			@name = n
		end
		def setList(l)
			@list = l
		end			
	end
	
	def index
    @t = Tag.all
    @tNames = []
    @tIDs =Array.new(size = 0, Array)       
    
    @t.each do |t|              #represent all tags in an array of names, and an array of d_thread_ids, with 1:1 index mapping between corresponding elements
    	if @i = @tNames.index(t.name)	
    		@tIDs[@i] << t.id
    	else
    		@tNames << t.name
    		@tIDs << []
    		@tIDs[-1 + @tIDs.size] << t.id
    	end
    end
    
    @t_disp = []                            #combine the 2 arrays, into one array of objs tgs
    for run in 0..(-1 + (@tNames.size >= @tIDs.size ? @tNames.size : @tIDs.size ))
    	@t_disp << Tgs.new(@tNames[run], @tIDs[run])
    end
    
    @t_disp.sort! { |y,x| x.getList.size <=> y.getList.size } #sort array according to number of threads with associated tag
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end
  
  def show
  	@t = Tag.find(params[:id])
  	@t_array = Tag.where(:name => @t.name) 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @d_thread }
    end
  end
end
