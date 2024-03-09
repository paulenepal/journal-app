class AddUserIdToTaskCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :task_categories, :user_id, :integer
    add_index :task_categories, :user_id
  end
end
