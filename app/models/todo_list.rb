class TodoList < ActiveRecord::Base
  has_many :todo_items, -> { order("position ASC") }, :dependent => :destroy
  accepts_nested_attributes_for :todo_items, allow_destroy: true
end
