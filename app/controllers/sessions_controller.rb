class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:session][:email])
		if user.nil?
			flash.now[:error] = "User doesn't exist."
			render 'new'
		elsif user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to questions_path
		else
			flash.now[:error] = "Invalid password."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to photos_path
	end

end
