class RoundsController < ApplicationController

	  def index
	  	@rounds = Round.all
	  end

	  def show
	  	@round = Round.find(params[:id])
	  end

	  def new
	  	@round = Round.new
	  end

	  def create
	  	@game = Game.find(params[:game_id])
	  	@round = @game.rounds.create(round_params)
	  	redirect_to @round
	  end

	  def update
	  	@round = Round.find(params[:id])

	  	if @round.update(round_params)
	  		redirect_to @round
	  	else
	  		render 'edit'
	  	end
	  end

	  def edit
	  	@round = Round.find(params[:id])
	  end

	  def destroy
	  	@game = Game.find(params[:game_id])
	  	@round = @game.questions.find(params[:id])
	  	@round.destroy
	  	redirect_to games_path(@game)
	  end

	  private
	  def round_params
	  	params.require(:round).permit(:player, :complete, :current_turn, :correct)
	  end
end
