class AddMeterToGames < ActiveRecord::Migration
  def change
    add_column :games, :meter, :integer
  end
end
