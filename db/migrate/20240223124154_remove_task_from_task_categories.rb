class RemoveTaskFromTaskCategories < ActiveRecord::Migration[7.1]
  def change
    remove_reference :task_categories, :task, null: false, foreign_key: true
  end
end
