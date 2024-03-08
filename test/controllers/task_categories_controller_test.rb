require "test_helper"

class TaskCategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
  end

  test "should get index" do
    get task_categories_path
    assert_response :success
  end

  test "should get show" do
    get task_category_path(task_categories(:cat_one))
    assert_response :success
  end

  test "should get new" do
    get new_task_category_path
    assert_response :success
  end

  test "should create a task category" do
    post task_categories_path, params: { task_category: { name: "New Task Cat" } }
    assert_redirected_to task_categories_path
  end

  test "should edit a task category" do
    get edit_task_category_path(task_categories(:cat_one))
    assert_response :success
  end

  test "should update a task category" do
    patch task_category_path(task_categories(:cat_one)), params: { task_category: {name: "New Name"}}
    assert_redirected_to task_categories_path
  end

  test "should delete a task category" do
    delete task_category_path(task_categories(:cat_one))
    assert_redirected_to task_categories_path
  end
end
