class AddCurrentPieceToGames < ActiveRecord::Migration
  def change
    add_column :games, :current_piece, :string
  end
end
