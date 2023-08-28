Rails.application.routes.draw do
  root to: 'contracts#index'
  get "/work_statuses", to: 'contracts#work_statuses'
  get "/planning", to: 'contracts#planning'
  resources :contracts do
    resources :elevators
  end
end
