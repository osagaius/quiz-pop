class AddChallengeBooleansToGames < ActiveRecord::Migration
	def change
		add_column :games, :player_1_challenge_completed, :boolean, :default => false
		add_column :games, :player_2_challenge_completed, :boolean, :default => false
	end
end
