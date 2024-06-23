Rails.application.routes.draw do

  devise_for :admins
    root to: "homes#top"
    get 'homes/about'
    
  devise_for :public, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
    resources :customers, only: [:index, :edit, :update, :create]
    get 'searches/index'
    resources :posts, only: [:edit, :index, :new, :show, :update, :create, :destroy]
    resources :user_posts, only: [:index, :show, :create] 
  end

  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  #以下はゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
   get 'postes/index'
   get 'searhes/index'
   get 'user_pages/index'
   resources :user_posts, only: [:show, :index]
   
end

