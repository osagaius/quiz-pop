class GamesController < ApplicationController
	respond_to :html, :json

	def index
		@games = Game.all
		@vis_js = 1
	end

	def create
		@game = Game.new(game_params)
		@game.turn = current_user.id
		@game.meter = 0
		@game.special_mode = false
		@game.challenge = false
		@game.meter = 0
		@game.streak = false
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

		if player1?(@game)
			@current_user_pieces = @game.player_1_pieces
			@opponent_pieces = @game.player_2_pieces
		else
			@current_user_pieces = @game.player_2_pieces
			@opponent_pieces = @game.player_1_pieces
		end
	end

	def verify
		@game = Game.find(params[:game_id])
		@choice = params[:choice]
		@question = Question.find(params[:question_id])

		if @question.correct_answer == @choice
			if @game.special_mode
				if @game.challenge
				else
					add_player_piece(@game)
				end
			else
				increment_meter(@game)
			end
		else
			if @game.special_mode
				if @game.challenge
				else
					@game.special_mode = false
				end
			end
			reset_meter(@game)
			change_turn(@game)
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
			if @game.streak
				render action: 'special.js.erb'
			else
				redirect_to_game(@game)
			end
		else			
			respond_to do |format|
				format.js
			end
		end
	end

	def specialMode
		@game = Game.find(params[:game_id])
		if params[:choice] == 'piece'
			@game.challenge = false
			@game.save
		else
			@game.challenge = true
		end
		redirect_to_game(@game)
	end

	def updateQuestion
		@category = params[:category]
		@game = Game.find(params[:id])
		@game.current_category = params[:category]
		if @game.save
			respond_to do |format|
				format.js { render :partial => "question" }
			end
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

			@game.winner = @game.player1
			@game.loser = current_user.id
			@game.player_1_score+=1
		end
		@game.save
		redirect_to welcome_index_path
	end

	private

	def increment_meter(a_game)
		@game = Game.find(a_game.id)
		@game.meter += 1
		if @game.meter >= 3
			@game.streak = true
			reset_meter(@game)
			puts "resetting and setting streak to true"
		else
			@game.streak = false
		end
		
		@game.save
	end
	def reset_meter(a_game)
		@game = Game.find(a_game.id)
		@game.streak = false
		@game.meter = 0
		@game.save
	end
	def change_turn(a_game)
		@game = Game.find(a_game.id)
		if @game.player1 == current_user.id
			@game.turn = @game.player2
		else
			@game.turn = @game.player1
		end
		game.save
	end

	def redirect_to_game(game)
		@game = Game.find(game.id)
		@path = '/games/' + @game.id.to_s
		render js: %(window.location.pathname='#{@path}')
	end

	def add_player_piece(game)
		@game = Game.find(game.id)
		@piece = Category.find(game.current_category).title
		if player1?(game)
			@game.player_1_pieces += [@piece]
		else
			@game.player_2_pieces += [@piece]
		end
		@game.special_mode = false
		@game.save
	end

	def player1?(game)
		game.player1 == current_user.id
	end

	def player2(game)
		game.player1 == current_user.id
	end
	def game_params
		params.require(:game).permit(:player1, :player2, :question)
	end
end
