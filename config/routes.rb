# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :videos, only: %i[show]

  get 'login', to: 'sessions#index'
  post 'login', to: 'sessions#authenticate'
  delete 'login', to: 'sessions#destroy'
end
