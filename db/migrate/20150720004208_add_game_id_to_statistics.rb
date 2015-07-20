class AddGameIdToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :game_id, :integer
  end
end
