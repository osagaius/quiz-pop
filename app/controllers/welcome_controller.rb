class WelcomeController < ApplicationController
	def index
		@incomplete = []
		@player_turn = []
		@opponent_turn = []
		@complete = []

		Game.where("player1 = ? OR player2 = ?", current_user.id, current_user.id).find_each do |game|
			if game.complete == false
				@incomplete.push(game)
				
				if game.turn == current_user.id
					@player_turn.push(game)
				else
					@opponent_turn.push(game)
				end
			else
				@complete.push(game)
			end
		end
	end
end
