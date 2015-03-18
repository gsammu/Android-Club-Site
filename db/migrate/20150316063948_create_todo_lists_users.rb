class CreateTodoListsUsers < ActiveRecord::Migration
  def change
    create_table :todo_lists_users do |t|
      t.references :user, index: true
      t.references :todo_list, index: true

      t.timestamps null: false
    end
    add_foreign_key :todo_lists_users, :users
    add_foreign_key :todo_lists_users, :todo_lists
  end
end
