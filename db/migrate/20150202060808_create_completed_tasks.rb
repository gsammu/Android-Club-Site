class CreateCompletedTasks < ActiveRecord::Migration
  def change
    create_table :completed_tasks do |t|
      t.references :user, index: true
      t.references :todo_item, index: true

      t.timestamps null: false
    end
    add_foreign_key :completed_tasks, :users
    add_foreign_key :completed_tasks, :todo_items
  end
end
