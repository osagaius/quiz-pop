class AddChallengeCountToGames < ActiveRecord::Migration
  def change
    add_column :games, :challenge_count, :integer
  end
end
