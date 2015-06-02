class ChangeGameChallengeDefault < ActiveRecord::Migration
	def change
		change_column :games, :challenge, :boolean, :default => false
	end
end