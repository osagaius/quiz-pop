class AddStreakToGames < ActiveRecord::Migration
  def change
    add_column :games, :streak, :boolean, :default => false
  end
end
