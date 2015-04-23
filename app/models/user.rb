class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  attr_accessor :login
  attr_accessor :games


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

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  def get_full_name
    firstname + " " + lastname
  end

  def games
    @games = Game.where(:player1 => self.id, :player2 => self.id)
    puts @games
  end


  validates :username,
  :presence => true,
  :uniqueness => {
  	:case_sensitive => false
  }
end	
