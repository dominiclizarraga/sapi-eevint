Rails.application.routes.draw do
  root to: 'contracts#home'

  get "/work_statuses", to: 'contracts#work_statuses'
  
  get "/planning", to: 'contracts#planning'
  
  resources :contracts do
    resources :elevators
    collection do
      get :history
      get :modal
    end
  end
  
  get 'charts', to: 'charts#index'
  
  resources :quality_issues
end
