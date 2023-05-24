Rails.application.routes.draw do
  root 'contracts#index'

  resources :task_types
  
  resources :contracts do
    resources :elevators
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
