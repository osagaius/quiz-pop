class QuizzesController < ApplicationController

	def index
		@question = Question.last
		@@question = @question
		@quizzes = Quiz.all
		@quiz = Quiz.new
	end

	def verify
		@data = params[:choice]
		@question = @@question
	end

	def create
	    @question = Question.order_by_rand.first 

	    respond_to do |format|
	      if @quiz.save
	        format.html { redirect_to @quest, notice: 'Correct answer.' }
	        format.json { render action: 'show', status: :created, location: @quiz }
	        # added:
	        format.js   { render action: 'show', status: :created, location: @quiz }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @quiz.errors, status: :unprocessable_entity }
	        # added:
	        format.js   { render json: @quiz.errors, status: :unprocessable_entity }
	      end
	    end
	 end
end
