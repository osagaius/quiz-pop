class AddPlayer1PiecesToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_1_pieces, :text, array:true, default: []
    add_column :games, :player_2_pieces, :text, array:true, default: []
  end
end
