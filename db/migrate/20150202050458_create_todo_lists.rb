class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end
