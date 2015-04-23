class ChangePlayerScoresDefaultToZeroInGames < ActiveRecord::Migration
	def change
		change_column :games, :player_1_score, :integer, :default => 0
		change_column :games, :player_2_score, :integer, :default => 0
	end
end
