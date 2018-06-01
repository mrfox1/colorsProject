Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { sessions: 'user/sessions'}

  resources :posts do
    collection do
      get 'fresh'
    end
  end

  resources :profiles, only: :show
  resources :categories, only: :show
  resources :tags, only: :show

  namespace :admin do
    resources :categories, except: [:show, :index]
  end
end
