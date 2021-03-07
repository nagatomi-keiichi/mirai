Rails.application.routes.draw do
  get 'users/show'
  get 'diaries/index'
  devise_for :users
  root to: "diaries#index"
  resources :diaries
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
