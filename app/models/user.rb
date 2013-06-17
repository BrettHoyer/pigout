class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :city, :state, :zip_code, :first_name, :last_name, :provider, :uid, :name
  # attr_accessible :title, :body

  has_many :favorites

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	    user = User.create(name:auth.extra.raw_info.name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20],
	                         city: auth.info.location
	                         )
	  end
	  user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
