class GamesController < ApplicationController
	
	def index
		@games = Game.all
	end

	def create
		@game = Game.new(game_params)
		@game.turn = current_user.id
		@game.complete = false

		if @game.save
			redirect_to welcome_index_path
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end


	def new
		@game = Game.new
		WillPaginate.per_page = 5
		@users = User.paginate(page: params[:page])
	end

	def destroy
		@game = Game.find(params[:id])
		puts @game.id
		@game.complete = true
		@game.loser = current_user.id
		@game.save
		redirect_to welcome_index_path
	end

	private
	def game_params
		params.require(:game).permit(:player1, :player2)
	end
end
