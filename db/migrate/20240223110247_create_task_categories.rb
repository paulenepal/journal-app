class CreateTaskCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :task_categories do |t|
      t.text :name
      #t.references :task, null: false, foreign_key: { to_table: :tasks }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
