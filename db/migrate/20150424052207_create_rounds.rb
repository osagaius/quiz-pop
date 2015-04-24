class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|

      t.timestamps null: false
      t.integer :player
      t.boolean :complete
      t.integer :current_turn
      t.integer :correct
    end
  end
end
