class QuizzesController < ApplicationController

	def index
		@question = Question.order_by_rand.first 
		@@question = @question
	end

	def search
		@data = params[:choice]
		@question = @@question
	end
end
