Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  get '/tasks_today', to: 'tasks#today', as: 'today_tasks'
  get '/tasks_completed', to: 'tasks#completed', as: 'completed_tasks'
  get '/tasks_overdue', to: 'tasks#overdue', as: 'overdue_tasks'
  get '/tasks_upcoming', to: 'tasks#upcoming', as: 'upcoming_tasks'

  resources :task_categories do 
    resources :tasks, shallow: true
  end

end
