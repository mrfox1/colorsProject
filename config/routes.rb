Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/edit'
  end
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
    resources :users, only: [:index, :edit, :update]
  end
end
