class AddSpecialModeToGames < ActiveRecord::Migration
  def change
    add_column :games, :special_mode, :boolean
  end
end
