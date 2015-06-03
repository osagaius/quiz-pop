class AddRewardToGames < ActiveRecord::Migration
  def change
    add_column :games, :reward, :string
  end
end
