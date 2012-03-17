class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  def self.find_for_omniauth_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    puts "==============================="
    puts data
    puts "==============================="
    if data.email
      if user = User.where(:email => data.email).first
        user
      else
        User.create!(:email => data.email, :password => Devise.friendly_token[0,20]) 
      end
    end
  end

end
