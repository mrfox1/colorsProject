Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts
  resources :profiles, only: :show
  resources :categories, only: [:index, :show]
  resources :tags, only: :show

  scope :admin, as: 'admin' do
    resources :categories, only: [:new, :create]
  end
end
