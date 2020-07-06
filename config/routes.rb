Rails.application.routes.draw do
  root "opinions#index"

  resources :sessions, only: [:new, :create, :destroy]

  resources :opinions, only: [:index, :new, :edit, :update, :create, :destroy]

  resources :users

  resources :followings, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]
end
