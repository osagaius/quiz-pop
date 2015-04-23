class GamesController < ApplicationController

	def index
		@games = Game.all
	end

	def create
		@game = Game.new(game_params)

		if @game.save
			redirect_to @game
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end


	def new
		WillPaginate.per_page = 10
		@users = User.paginate(page: params[:page])
	end

	private
	def game_params
		params.require(:game).permit(:player1, :player2)
	end
end
