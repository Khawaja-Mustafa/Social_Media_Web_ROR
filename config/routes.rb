# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :friendships

  resources :posts do
    resources :comments
      # get 'comments/:id/destroy' => 'comments#destroy', as: 'comment_destroy'
  end

  # resources :posts
  resources :posts do
    resources :likes
  end

  # get 'accounts/show'
  # resources :accounts
  resources :accounts do
    # there are two methods of making custom routes with proper alias, and both are done below
    # get 'accounts/:id/profile' => 'accounts#profile', as: 'profile'
    member do
      get :profile
    end
  end

  # resources :rooms
  resources :rooms do
    resources :messages
  end

  root to: 'public#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :accounts, only: %i[index show create]
    end
  end
end
