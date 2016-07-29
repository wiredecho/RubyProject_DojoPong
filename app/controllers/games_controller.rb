class GamesController < ApplicationController
	def create
		win = User.find_by(id: params[:game][:winner_id])
		score_current = win.wins
		score_new = score_current + 1
		User.update(win.id, {wins: score_new})

		loss = User.find_by(id: params[:game][:loser_id])
		score_current = loss.losses
		score_new = score_current + 1
		User.update(loss.id, {losses: score_new})
		
		game = Game.new(game_params)
		flash[:errors] = game.errors.full_messages unless game.save
  		redirect_to :back
	end

	private

		def game_params
			params.require(:game).permit(:winner_id, :loser_id, :wscore, :lscore)
		end

end