Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
    resources :departments
    resources :employees
  end
  resources :positions
end
