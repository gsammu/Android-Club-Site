class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :omniauthable, 
    :omniauth_providers => [:google_oauth2]

  
  has_many :progresses
  has_many :tasks, through: :progresses
  validates_presence_of :username, :email

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    
    # Update display name if necessary
    user.update_attribute(:display_name, data.first_name)
    user
  end

  def remember_me
    true
  end

end
