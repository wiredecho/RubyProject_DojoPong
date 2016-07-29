class SessionsController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@opponents = User.all.sort_by{|p| -p[:wins]}
		@losers = Game.joins(:loser).select("users.name, games.lscore")
		@winners = Game.joins(:winner).select("users.name, games.wscore")
		
	end
	


	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/dashboard"
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