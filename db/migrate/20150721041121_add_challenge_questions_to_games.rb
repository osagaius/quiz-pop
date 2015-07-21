class AddChallengeQuestionsToGames < ActiveRecord::Migration
	def change
		add_column :games, :challenge_questions, :integer, array:true, default: []
	end
end
