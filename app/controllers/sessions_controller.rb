class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
	$CURRENT_USER = $glo = user.id      
	$signinuser = user
	$nnn = user.name
	redirect_back_or user
    end
  end

  def destroy
  	$CURRENT_USER = nil
    sign_out
    redirect_to root_path
  end

end
