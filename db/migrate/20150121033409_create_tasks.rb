class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :week
      t.string :description

      t.timestamps null: false
    end
  end
end
