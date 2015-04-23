class Game < ActiveRecord::Base
	has_many :rounds, dependent: :destroy
end
