class AddUserIdToTaskCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :task_categories, :user, null: false, foreign_key: true
  end
end
