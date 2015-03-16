class TodoList < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :todo_items, -> { order("position ASC") }, dependent: :destroy
  accepts_nested_attributes_for :todo_items, allow_destroy: true
  accepts_nested_attributes_for :users 
  def completed?(user)
  	self.todo_items.each do |todo_item|
  	  unless todo_item.completed?(user)
  	  	return false
  	  end
  	end
  	  return true
  end
end
