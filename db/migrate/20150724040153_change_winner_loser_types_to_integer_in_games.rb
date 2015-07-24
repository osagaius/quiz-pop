class ChangeWinnerLoserTypesToIntegerInGames < ActiveRecord::Migration
  def change
  	  change_column :games, :winner, 'integer USING CAST(winner AS integer)'
  	  change_column :games, :loser, 'integer USING CAST(loser AS integer)'
  end
end
