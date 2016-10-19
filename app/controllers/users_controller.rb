class UsersController < ApplicationController


	def create
		@user = User.new user_params
		if @user.save
			flash[:success] = "You have created your account successfully!"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
			render 'new'
		end
	end
	
  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end
private
	def user_params
		params.require(:user).permit(:name, :password, :email, :password_confirmation, :image_url)
	end
end
