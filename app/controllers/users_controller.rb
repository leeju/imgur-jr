class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:success] = "You're now registered."
			redirect_to photos_path
		else
			flash.now[:error] = "Make sure your password matches!"
			render 'new'
		end
	end

	# def destroy
	# 	@user.destroy
	# end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
