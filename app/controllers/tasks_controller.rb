class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_category, only: [:new, :create]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
    authorize_user(@task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.task_category = @task_category

    if @task.save
      redirect_to task_category_path(@task_category), notice: "Whoopee! You've just created a new task! 🎉"
    else
      render :new
    end
  end

  def edit
    authorize_user(@task)
  end

  def update
    if @task.update(task_params)
      redirect_to task_category_path(@task.task_category), notice: "You've boosted productivity by editing your task! 🙌"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to task_category_path(@task.task_category), notice: "Awesome! You've made a decisive move in boosting productivity by successfully deleting a task! 🤟"
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

  def authorize_user(task)
    unless task.user_id == current_user.id
      redirect_to task_categories_path, notice: "Oops! The task you're trying to access doesn't exist from you list. 👻"
    end
  end

end