# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :friendships
  # resources :rooms
  resources :rooms do
    resources :messages
  end

  resources :posts do
    resources :comments
  end

  # resources :posts
  resources :posts do
    resources :likes
  end

  # get 'accounts/show'
  resources :accounts

  root to: 'public#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :accounts, only: %i[index show create]
    end
  end
end
