Rails.application.routes.draw do
  resources :elevators
  resources :task_types
  resources :contracts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
