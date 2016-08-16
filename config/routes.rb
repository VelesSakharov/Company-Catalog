# frozen_string_literal: true
Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
    resources :departments
    resources :users
  end
  resources :positions
end
