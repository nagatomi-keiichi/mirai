Rails.application.routes.draw do
  get 'users/show'
  get 'diaries/index'
  devise_for :users
  root to: "diaries#index"
  resources :diaries
  resources :users, only: [:show] do
    collection do
      get 'search'
    end
  end

  resources :relationships, only: [:create, :destroy]
  get 'following/:id' => 'relationships#followings', as:'followings'
  get 'follower/:id' => 'relationships#followers', as:'followers'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
