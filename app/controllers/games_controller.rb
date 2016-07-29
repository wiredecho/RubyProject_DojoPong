class GamesController < ApplicationController
	def create
		game = Game.new(game_params)
		flash[:errors] = game.errors.full_messages unless game.save
  		redirect_to :back
	end

	private
		def game_params
			params.require(:game).permit(:winner_id, :loser_id, :wscore, :lscore)
		end

end