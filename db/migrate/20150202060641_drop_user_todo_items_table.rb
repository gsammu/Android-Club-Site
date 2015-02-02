class DropUserTodoItemsTable < ActiveRecord::Migration
  def change
    drop_table :user_todo_items
  end
end
