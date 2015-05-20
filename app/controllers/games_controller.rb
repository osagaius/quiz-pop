class GamesController < ApplicationController
	@@question = Question.first

	helper_method :update_question

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
		@game.current_question = Question.order_by_rand.where(category: 1).first
		@@question = @game.current_question		
	end

	def new_question
		@question = Question.order_by_rand.where(category: category).first
		@@question = @game.current_question	
	end

	def verify
		@data = params[:choice]
		@question = @game.current_question
		if @question.correct_answer == @data
			respond_to do |format|
				format.js do
					render js:	"alert('Correct!');"
				end
			end
		else
		end
	end
	
	def edit
		@game = Game.find(params[:id])
		@question = params[:question]
	end

	def update
		@game = Game.find(params[:id])
		@game.current_question = 
		if @game.update_attributes(game_params)
			redirect_to @game
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
		params.require(:game).permit(:player1, :player2, :question)
	end
end
