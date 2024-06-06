Rails.application.routes.draw do

  
  namespace :public do
    devise_for :publics
    root to: "homes#top"
    get 'homes/about'
    resources :customers, only: [:index, :edit]
    get 'searches/index'
    resources :posts, only: [:edit, :index, :new, :show, :update]
    resources :user_posts, only: [:index, :show]
  end
  
  devise_for :users
  #以下はゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  namespace :admin do
   get 'postes/index'
   get 'searhes/index'
   get 'user_pages/index'
   resources :user_posts, only: [:show, :index]
  end
end

