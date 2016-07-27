class SessionsController < ApplicationController
	def index
	end
	

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to :root
		else
			flash[:errors] = ["You are an imposter!"]
			redirect_to :back
		end
	end

	def destroy
		reset_session
		redirect_to :root
	end

end