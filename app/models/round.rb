class Round < ActiveRecord::Base
	belongs_to :game
	has_many :turns, dependent: :destroy
	has_many :quizzes, dependent: :destroy

	def self.most_recent
    	order('created_at DESC').limit(1).first
  	end
end
