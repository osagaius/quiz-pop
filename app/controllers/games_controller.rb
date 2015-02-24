class GamesController < ApplicationController
	def index
    	@games = Article.all
  	end

	def create
	  @game = Game.new(game_params)
	 
	  @game.save
	  redirect_to @game
	end

	def show
    	@game = Game.find(params[:id])
  	end


  	def new
  	end
	 
	private
	  def game_params
	    params.require(:game).permit()
	  end
end
