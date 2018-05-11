Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  root 'posts#index'
  devise_for :users
  resources :posts
  resources :profile, only: :show
  resources :categories, only: [:index, :show]

  scope :admin, as: 'admin' do
    resources :categories, only: [:new, :create]
  end
end
