# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'gossips#index'

  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'

  resources :sessions, only: [:new, :create, :destroy]
  resources :cities
  resources :users
  resources :gossips
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
