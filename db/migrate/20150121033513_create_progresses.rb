class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.references :user, index: true
      t.references :task, index: true
      t.string :commit_url
      t.text :message

      t.timestamps null: false
    end
    add_foreign_key :progresses, :users
    add_foreign_key :progresses, :tasks
  end
end
