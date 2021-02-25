Rails.application.routes.draw do
  get 'diaries/index'
  devise_for :users
  root to: "diaries#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
