class TodoListSerializer < ActiveModel::Serializer
  attributes :id, :title, :deadline
  has_many :todo_items
end
