class Statistic < ActiveRecord::Base
	has_one :user

	def self.insert(user, game, question, correct)
		@stat = Statistic.new
		@stat.user_id = user.id
		@stat.category = game.current_category
		@stat.correct = correct
		@stat.question = question.id
		@stat.game_id = game.id
		@stat.save
		puts
	end
end
