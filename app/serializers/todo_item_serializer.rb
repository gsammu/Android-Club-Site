class TodoItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
end
