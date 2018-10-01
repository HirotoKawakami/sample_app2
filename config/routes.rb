Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :microposts do
    resources :comments do
      member do
        get :reply
      end
    end
  end


  resources :users do
    member do
      get :following, :followers, :likeindex
    end
  end

  resources :likes
  resources :relationships, only: [:create, :destroy]
end
