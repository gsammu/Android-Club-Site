class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :omniauthable, 
    :omniauth_providers => [:google_oauth2]

  has_many :completed_tasks
  has_many :todo_items, through: :completed_tasks
  has_many :todo_lists_users
  has_many :todo_lists, through: :todo_lists_users
  accepts_nested_attributes_for :todo_lists
  validates_presence_of :email

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    p data = access_token.info
    p id_info = access_token.id_info
    user = User.where(:email => data["email"]).first
    
    # Update display name if necessary
    user.andand.update_attribute(:display_name, data.first_name)
    user
  end

  def remember_me
    true
  end
  def self.reminder_task
    User.all.each do |user|
      if TodoList.joins(:users).where("users.id" => user.id).
                  where("todo_lists.deadline < ?", Time.now + 1.day).exists?
        UserMailer.task_reminder(user).deliver_now
      end
    end
  end
end
