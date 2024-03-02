Rails.application.routes.draw do
  devise_for :users
  resources :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"

  resources :task_categories do 
    resources :tasks, shallow: true
  end
  
  resources :task do
    collection do
      get :show_today # custom route to show task due todayy
      get :show_completed #show commpleted task
    end
  end
  
end
