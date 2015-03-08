class TodoListSerializer < ActiveModel::Serializer
  attributes :id, :title, :deadline
  has_many :todo_items

  def deadline
    object.deadline.to_i
  end
end
