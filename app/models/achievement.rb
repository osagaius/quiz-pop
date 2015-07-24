class Achievement < ActiveRecord::Base
	def self.get_user_achievements(id)
		achievements = []

		achievements.push("15 Questions Answered") if Statistic.user_total_count(User.find(id)) >= 15
		achievements.push("10 Questions Correct") if Statistic.user_correct_count(User.find(id)) > 10
		achievements.push("30 Questions Correct") if Statistic.user_correct_count(User.find(id)) > 30		
		achievements.push("Won 1 Game") if Game.where("winner = ?", id).count > 1
		achievements.push("Won 10 Games") if Game.where("winner = ?", id).count > 10

		achievements
	end
end
