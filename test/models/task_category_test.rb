require "test_helper"

class TaskCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save TaskCategory without name" do
    task_category = TaskCategory.new
    assert_not task_category.save, "Saved the TaskCategory without name"
  end

  test "should not save TaskCategory if name length > 20" do
    task_category = TaskCategory.new
    name = "This should not save. I am more than 20 characters."
    assert_not task_category.save, "Saved the TaskCategory without name"
  end

end
