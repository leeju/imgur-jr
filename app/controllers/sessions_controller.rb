class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:session][:email])
		if user.nil?
			flash.now[:error] = "Invalid email/password combination."
			render 'new'
		elsif user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to photos_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to photos_path
	end

end
