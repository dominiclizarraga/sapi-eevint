Rails.application.routes.draw do
  root to: 'contracts#index'
  get "/work_statuses", to: 'contracts#work_statuses'
  resources :contracts do
    resources :elevators
  end
end
