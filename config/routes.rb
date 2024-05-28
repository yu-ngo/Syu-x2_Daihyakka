Rails.application.routes.draw do
  get 'searches/index'
  resources :user_posts, only: [:index, :show]
  resources :posts, only: [:edit, :index, :new, :show]
  devise_for :publics
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
