Rails.application.routes.draw do
  
  # devise_for :accounts
  devise_for :accounts, controllers: {
        sessions: 'accounts/sessions'
      }
      
  resources :posts do
    resources :comments
  end

  # resources :posts
  resources :posts do
    resources :likes
  end
  


  root to: 'public#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
