class RemoveUserFromTaskCategories < ActiveRecord::Migration[7.1]
  def change
    remove_reference :task_categories, :user, null: false, foreign_key: true
  end
end
