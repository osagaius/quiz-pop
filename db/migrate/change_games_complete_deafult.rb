class ChangeDefaultGameCompleted < ActiveRecord::Migration
	def change
		change_column :games, :default, :boolean, :default => false
	end
end