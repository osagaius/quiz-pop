class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  	else
  		if conditions[:username].nil?
  			where(conditions).first
  		else
  			where(username: conditions[:username]).first
  		end
  	end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  validates :username,
  :presence => true,
  :uniqueness => {
  	:case_sensitive => false
  }
end	
