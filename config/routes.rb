Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  # resources :posts
  resources :posts do
    resources :likes
  end
  devise_for :accounts
  root to: 'public#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
