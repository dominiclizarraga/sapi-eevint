Rails.application.routes.draw do
  root 'contracts#index'
  resources :contracts do
    resources :elevators
  end
end
