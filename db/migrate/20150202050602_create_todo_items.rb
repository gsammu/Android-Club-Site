class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :title
      t.text :description
      t.references :todo_list, index: true
      t.integer :position

      t.timestamps null: false
    end
    add_foreign_key :todo_items, :todo_lists
  end
end
