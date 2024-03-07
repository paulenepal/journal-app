require "application_system_test_case"

class TaskCatergoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
  end

  test "should get index" do
    visit task_categories_path
    assert_selector "h1", text: "🎯 My Plans"
  end

  test "should create a Task Category" do
    visit task_categories_path

    within '.add' do
      click_on "Add Category"
    end

    within 'form[action="/task_categories"]' do
      fill_in 'task_category[name]', with: 'New Category'
      click_button 'Submit'
    end

    assert_text "Yay! You've taken the first step towards productivity by successfully creating a category! 🥳"
  end

  test "should edit a Task Category" do
    @task_category = task_categories(:cat_one)
    visit edit_task_category_path(@task_category)

    assert_selector 'input[type="text"]', visible: true, count: 1
    fill_in 'task_category[name]', with: 'School'
    click_button 'Submit'

    assert_text "Way to go! You've boosted productivity by editing a category! 🫰"
  end

  test "should be able to create a task under a Task Category" do
    @task_category = task_categories(:cat_one)
    visit task_category_path(@task_category)

    assert_text @task_category.name

    within '.add' do
      click_link
    end

    assert_selector "h1", text: 'Add Task for'
    fill_in 'task[name]', with: 'Finish Research Paper'
    fill_in 'task[description]', with: "Lorem ipsum.."
    click_button 'Submit'

    assert_text "Whoopee! You've just created a new task! 🎉"
  end

end
