class UserTodoItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo_item
end
