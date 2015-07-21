class AddChallengeScoresToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_1_challenge_score, :integer
    add_column :games, :player_2_challenge_score, :integer
  end
end
