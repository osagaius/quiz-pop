class ChangeDefaultGameMeter < ActiveRecord::Migration
	def change
		change_column :games, :meter, :integer, :default => 0
	end
end