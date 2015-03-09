class Question < ActiveRecord::Base
	validates :text,
	:presence => true,
	:uniqueness => {
		:case_sensitive => false
	}	
	validates :correct_answer, presence: true
	validates :wrong_answer_1, presence: true
	validates :wrong_answer_2, presence: true
	validates :wrong_answer_3, presence: true
end
