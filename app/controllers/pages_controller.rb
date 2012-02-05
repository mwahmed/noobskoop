class PagesController < ApplicationController
  def home
	@title="Home"
  end

  def contact
	@title="Contact"
  end

  def about
	@title="About Us"
  end

  def help
	@title="Help"
  end

  def ece
	@title = "ECE"
	@path  = "#{root_path}"+"course/" + "#{params[:course]}"
        if @path == "/course/"
		@title = "ECE"
		render 'ece'
	else
 
        redirect_to @path
	end
  end

	def ece_
		@crsCode = params[:crs_code]
	end
=begin	
  def ece318
	@title="ECE318"
  end
  def ece335
	@title="ECE335"
  end
  def ece330
	@title="ECE330"
  end
  def ece422
	@title="ECE422"
  end
  def ece442
	@title="ECE442"
  end
  def ece469
	@title="ECE469"
  end
  def ece525
	@title="ECE525"
  end
  def ece527
	@title="ECE527"
  end
  def ece535
	@title="ECE535"
  end

  def phy335
	@title="PHY335"
  end
  def ece314
	@title="ECE314"
  end
  def bme595
	@title="BME595"
  end
  def ece510
	@title="ECE510"
  end
  def ece533
	@title="ECE533"
  end

  def ece320
	@title="ECE320"
  end
  def ece413
	@title="ECE413"
  end
  def ece463
	@title="ECE463"
  end
  def ece524
	@title="ECE524"
  end
  def ece331
	@title="ECE331"
  end
  def ece334
	@title="ECE334"
  end
  def ece446
	@title="ECE446"
  end
  def ece512
	@title="ECE512"
  end
  def ece532
	@title="ECE532"
  end
  def ece451
	@title="ECE451"
  end
  def ece530
	@title="ECE530"
  end
  def ece534
	@title="ECE534"
  end
  def ece311
	@title="ECE311"
  end
  def ece316
	@title="ECE316"
  end
  def ece302
	@title="ECE302"
  end
  def ece410
	@title="ECE410"
  end
  def ece411
	@title="ECE411"
  end
  def ece417
	@title="ECE417"
  end
  def ece431
	@title="ECE431"
  end
  def ece445
	@title="ECE445"
  end
  def ece446
	@title="ECE446"
  end
  def ece462
	@title="ECE462"
  end
  def ece464
	@title="ECE464"
  end
  def ece469
	@title="ECE469"
  end
  def ece470
	@title="ECE470"
  end
  def ece516
	@title="ECE516"
  end
  def ece521
	@title="ECE521"
  end
  def ece537
	@title="ECE537"
  end
  def mie331
	@title="MIE331"
  end
  def ece342
	@title="ECE342"
  end
  def ece361
	@title="ECE361"
  end
  def ece461
	@title="ECE461"
  end
  def ece466
	@title="ECE466"
  end
  def ece532
	@title="ECE532"
  end
  def ece552
	@title="ECE552"
  end
  def ece344
	@title="ECE344"
  end
  def ece345
	@title="ECE345"
  end
  def csc326
	@title="CSC326"
  end
  def csc343
	@title="CSC343"
  end
  def csc418
	@title="CSC418"
  end
  def csc444
	@title="CSC444"
  end
  def csc467
	@title="CSC467"
  end
  def ece419
	@title="ECE419"
  end
  def ece448
	@title="ECE448"
  end
  def ece450
	@title="ECE450"
  end
  def ece454
	@title="ECE454"
  end
  def ece461
	@title="ECE461"
  end
  def ece540
	@title="ECE540"
  end
  def ece568
	@title="ECE568"
  end
=end



end
