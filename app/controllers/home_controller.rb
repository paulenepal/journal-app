class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to task_categories_path
    else
      render :index
    end
  end
end
