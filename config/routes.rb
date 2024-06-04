Rails.application.routes.draw do

  resources :customers, only: [:index, :edit]
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  get 'searches/index'
  resources :posts, only: [:edit, :index, :new, :show]
  resources :user_posts, only: [:index, :show]
  devise_for :publics
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  devise_for :users
  #以下はゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
