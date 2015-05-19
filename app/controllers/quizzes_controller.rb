class QuizzesController < ApplicationController

	def index
		@question = Question.order_by_rand.first 
		@@question = @question
	end

	def verify
		@data = params[:choice]
		respond_to do |format|
			if @data == @question.correct_answer
				format.json { "correct" }
			else
				format.json { "incorrect" }
			end
		end
	end

	def create
		@question = Question.order_by_rand.where(category: 1).first
		@quiz.question = @question.id

		respond_to do |format|
			if @quiz.save
				format.json { render action: 'show', status: :created, location: @quiz }
			end
		end
	end

	def show
		@quiz = Quiz.find(params[:id])
		@@question = Question.find(@quiz.question)
	end
end