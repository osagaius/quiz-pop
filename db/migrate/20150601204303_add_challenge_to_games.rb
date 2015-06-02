class AddChallengeToGames < ActiveRecord::Migration
  def change
    add_column :games, :challenge, :boolean
  end
end
