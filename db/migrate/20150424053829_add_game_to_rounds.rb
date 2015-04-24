class AddGameToRounds < ActiveRecord::Migration
  def change
    add_reference :rounds, :game, index: true
    add_foreign_key :rounds, :games
  end
end
