class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:success] = "You're now registered."
			session[:user_id] = @user.id
			redirect_to photos_path
		else
			flash.now[:error] = "Make sure your password matches!"
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :username, :password, :password_confirmation)
	end
end
