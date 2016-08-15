Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
    resources :departments, shalloy: true
    resources :users, shalloy: true
  end
  resources :positions
end
