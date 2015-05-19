class GamesController < ApplicationController
	@@question = Question.first

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
		@question = Question.order_by_rand.where(category: 1).first
		@@question = @question
	end

	def verify
		@data = params[:choice]
		@question = @@question
		if @question.correct_answer == @data
			respond_to do |format|
				format.js do
					render js:	"alert('Correct!');"
				end
			end
		else
			render js: "window.location='#{welcome_index_path}'"
		end
	end

	def new
		@game = Game.new
		WillPaginate.per_page = 5
		@users = User.paginate(page: params[:page])
	end

	def destroy
		@game = Game.find(params[:id])
		@game.complete = true
		if (current_user.id == @game.player1)
			@game.winner = @game.player2
			@game.loser = current_user.id
			@game.player_2_score = @game.player_2_score + 1
		else
			@game.winner = @game.player1
			@game.loser = current_user.id
			@game.player_1_score+=1
		end
		@game.save
		redirect_to welcome_index_path
	end

	private
	def game_params
		params.require(:game).permit(:player1, :player2)
	end
end
