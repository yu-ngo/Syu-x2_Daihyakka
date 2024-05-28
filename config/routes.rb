Rails.application.routes.draw do
  get 'searches/index'
  resources :posts, only: [:edit, :index, :new, :show]
  resources :user_posts, only: [:index, :show]
  devise_for :publics
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
