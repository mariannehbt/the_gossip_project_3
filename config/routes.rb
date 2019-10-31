# frozen_string_literal: true

Rails.application.routes.draw do
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'

  resources :gossips
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
