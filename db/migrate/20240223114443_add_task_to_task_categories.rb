class AddTaskToTaskCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :task_categories, :task, null: false, foreign_key: true
  end
end
