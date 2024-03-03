class TaskCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_category, only: [:show, :edit, :update, :destroy]
  before_action :set_task_categories, only: [:index, :edit, :new, :show, :destroy]
  
  def index
  end

  def show
    authorize_user(@task_category) # not sure why this doesn't work if i put this on before action
  end

  def new
    @task_category = TaskCategory.new
  end

  def create
    @task_category = current_user.task_categories.build(task_category_params)
    if @task_category.save
      redirect_to task_categories_path, notice: "Yay! You've taken the first step towards productivity by successfully creating a category! 🥳"
    else
      render :new
    end
  end

  def edit
    authorize_user(@task_category) # not sure why this doesn't work if i put this on before action
  end

  def update
    if @task_category.update(task_category_params)
      redirect_to task_categories_path, notice: "Way to go! You've boosted productivity by editing a category! 🫰"
    else
      render :edit
    end
  end

  def destroy
    @task_category.destroy
    redirect_to task_categories_path, notice: "Awesome! You've made a decisive move in boosting productivity by successfully deleting a category! 🤟"
  end

  private

  def task_category_params
    params.require(:task_category).permit(:name)
  end

  def set_task_category
    @task_category = TaskCategory.find(params[:id])
  end

  def authorize_user(task_category)
    unless task_category.user == current_user
      redirect_to task_categories_path, notice: "Oops! The category doesn't exist from your list. 👻"
    end
  end

  def set_task_categories
    @task_categories = current_user.task_categories.all
  end

end
