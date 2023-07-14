Rails.application.routes.draw do
  root 'contracts#work_statuses'
  resources :contracts do
    resources :elevators
  end
end
