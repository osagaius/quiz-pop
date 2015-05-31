class AddCurrentCategoryToGames < ActiveRecord::Migration
  def change
    add_column :games, :current_category, :integer
  end
end
