class Game < ActiveRecord::Base
	has_many :rounds, dependent: :destroy

	def self.reset_to_before_streak(id)
		@game = Game.find(id)
		@game.meter = 2
		@game.streak = false
		@game.special_mode = false
		@game.challenge = false
		@game.save
	end
end
