class GamesController < ApplicationController
	respond_to :html, :json

	def index
		@games = Game.all
		@vis_js = 1
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
		@game = Game.find(params[:game_id])
		@choice = params[:choice]
		@question = Question.find(params[:question_id])

		if @question.correct_answer == @choice
			increment_meter(@game)
		else
			reset_meter(@game)
		end

		respond_to do |format|
			format.js
		end
	end

	def feedback
		@game = Game.find(params[:game_id])
		@question = Question.find(params[:question_id])

		# @question.rating = params[:rating]

		@path = '/games/' + @game.id.to_s
		@correct = params[:correct]
		
		if @correct === 'true'
			render js: %(window.location.pathname='#{@path}')
		else
			reset_meter(@game)
			change_turn(@game)
			respond_to do |format|
				format.js
			end
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
	def increment_meter(game)
		puts 'game info'
		puts game.meter
		if game.meter >= 3
			@game.special_mode = true
			game.meter = 0
		end
		game.meter += 1
		game.save
	end
	def reset_meter(game)
		game.meter = 0
		game.save
	end
	def change_turn(game)
		if game.player1 == current_user.id
			game.turn = game.player2
		else
			game.turn = game.player1
		end
		game.save
	end
	def game_params
		params.require(:game).permit(:player1, :player2, :question)
	end
end
