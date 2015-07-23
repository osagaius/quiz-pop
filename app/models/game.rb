class Game < ActiveRecord::Base
	has_many :rounds, dependent: :destroy

	def self.reset_to_before_streak(id)
		@game = Game.find(id)
		@game.meter = 2
		@game.streak = false
		@game.special_mode = false
		@game.challenge = false
		@game.challenge_count = 0
		@game.player_1_challenge_score = 0
		@game.player_2_challenge_score = 0
		@game.challenge_count = 0
		@game.player_1_challenge_completed = false
		@game.player_2_challenge_completed = false
		@game.save
	end

	def challenge_winner
		return unless self.challenge

		if self.player_1_challenge_score > self.player_2_challenge_score
			self.player1
		elsif self.player_1_challenge_score < self.player_2_challenge_score
			self.player2
		else
			-1
		end
	end

	def challenge_over?
		self.player_1_challenge_completed && self.player_2_challenge_completed
	end

	def end_challenge
		self.meter = 0
		self.streak = false
		self.special_mode = false
		self.challenge = false
		self.challenge_count = 0
		self.player_1_challenge_score = 0
		self.player_2_challenge_score = 0
		self.challenge_count = 0
		self.player_1_challenge_completed = false
		self.player_2_challenge_completed = false
		self.save
	end

	def baz
		puts 'instance method'
	end
end
