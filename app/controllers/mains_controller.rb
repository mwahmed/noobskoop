class MainsController < ApplicationController

		def areaSelector(ary, area)
		 cpy = []
		 ary.length.times do |i|			 
			 	cpy << ary[i] if ary[i].area.to_s.include? area.to_s
		 end
		 return cpy
	 end

	 def ece
		@e = Course.where(:discipline => 'ECE')
		@c1F = Course.where("year = '1' AND session = 'F'" )    
    @c1S = Course.where("year = '1' AND session = 'S'" )
    @c2F = Course.where("year = '2' AND session = 'F'" )    
    @c2S = Course.where("year = '2' AND session = 'S'" )
    
		@cUf = Course.where("year = 'upper' AND (session = 'F' OR 'B')")
		@cUs = Course.where("year = 'upper' AND (session = 'S' OR 'B')")
	
		@cUF = []
		@cUS = []
		
		for i in 1..7	
			@cUF << areaSelector( @cUf.dup, i.to_s)
			@cUS << areaSelector( @cUs.dup, i.to_s)
		end
				
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @e }
    end
  end
end
