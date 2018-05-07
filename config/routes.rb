Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts
  resources :profile, only: :show
end
