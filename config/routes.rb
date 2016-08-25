Rails.application.routes.draw do
  root 'users#index'
  resources :companies do
    resources :departments
    resources :employees
  end
  resources :positions
  resources :users, only: [:update] do
    collection do
      get 'list'
    end
  end
end
