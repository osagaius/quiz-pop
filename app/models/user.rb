class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :rpx_connectable, :omniauth_providers => [:google_oauth2]

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

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
          )
      end
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
