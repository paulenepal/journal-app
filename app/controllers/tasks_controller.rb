class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_category, only: [:new, :create, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.task_category = @task_category

    if @task.save
      redirect_to task_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_categories_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :task_category_id, :completed)
  end

  def set_task_category
    @task_category = TaskCategory.find(params[:task_category_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
