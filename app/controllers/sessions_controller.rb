class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  		if @user = User.find_by(email: params[:email])
  			if @user.authenticate(params[:password])
  				session[:user_id] = @user.id
  				flash[:success] = 'You have logged in successfully!'
  				redirect_to root_path
  			else
  				flash.now[:error] = 'The email or password is incorrect!'
  				render 'new'
  			end
 			end
 	end

  def destroy
    session[:user_id]= nil
    flash[:success]= "You have logged out successfully"
    redirect_to new_login_path
  end
end
