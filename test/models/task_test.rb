require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save Task without name" do
    task = Task.new
    description = 'Lorem ipsum..'
    completed = false
    assert_not task.save, "Saved the Task without name"
  end

  test "should not save Task if description length > 200" do
    task = Task.new
    description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    completed = false
    assert_not task.save, "Saved the Task without name"
  end

end
