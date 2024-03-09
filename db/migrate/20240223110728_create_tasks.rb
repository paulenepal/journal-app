class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.datetime :due_date
      t.references :task_category, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
