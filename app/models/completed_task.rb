class CompletedTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo_item
  scope :user, ->(user_id){ where(user_id: user_id) }
end
