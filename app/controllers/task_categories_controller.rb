class TaskCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_category, only: [:show, :edit, :update, :destroy]
  before_action :set_task_categories, only: [:index, :edit, :new]
  
  def index
      @task_categories = current_user.task_categories
  end

  def show
    authorize_user(@task_category)
  end

  def new
    @task_category = TaskCategory.new
  end

  def create
    @task_category = current_user.task_categories.build(task_category_params)
    if @task_category.save
      redirect_to task_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task_category.update(task_category_params)
      redirect_to task_categories_path
    else
      render :edit
    end
  end

  def destroy
    @task_category.destroy
    redirect_to task_categories_path
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
      redirect_to task_categories_path, alert: "You don't have permission to access this task category."
    end
  end

  def set_task_categories
    @task_categories = current_user.task_categories.all
  end

end
