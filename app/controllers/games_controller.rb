class GamesController < ApplicationController
	respond_to :html, :json

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
		@question = Question.first
		@@question = @question
	end

	def verify
		@data = params[:choice]
		@question = Question.find(params[:question_id])
		if @question.correct_answer == @data
			render json: { message: "Correct" }
		else
			render json: { message: "Incorrect" }
		end
	end

	def updateQuestion
		@category = params[:category]
		@game = Game.find(params[:id])
		@game.current_category = params[:category]
		if @game.save
			render 'question'
		else
			render json: { message: "Error changing category", status: :not_found }
		end

	end

	def edit
		@game = Game.find(params[:id])
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
