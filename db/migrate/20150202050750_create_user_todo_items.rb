class CreateUserTodoItems < ActiveRecord::Migration
  def change
    create_table :user_todo_items do |t|
      t.references :user, index: true
      t.references :todo_item, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_todo_items, :users
    add_foreign_key :user_todo_items, :todo_items
  end
end
