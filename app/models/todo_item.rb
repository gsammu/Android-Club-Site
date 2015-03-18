class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  has_many :completed_tasks, dependent: :destroy
  has_many :users, through: :completed_tasks
  
  acts_as_list scope: :todo_list
  def completed?(user)
    completed_tasks.user(user.id).exists?
  end
end
