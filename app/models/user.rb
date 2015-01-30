class User < ActiveRecord::Base
  has_secure_password
  
  has_many :progresses
  has_many :tasks, through: :progresses
  validates_presence_of :username, :email

end
