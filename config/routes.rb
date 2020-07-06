Rails.application.routes.draw do
  # root "desktop#desktop"
  root "opinions#index"
  # get :desktop, to: "desktop#desktop", as: 'desktop'

  resources :sessions, only: [:new, :create, :destroy]

  resources :opinions, only: [:index, :new, :edit, :update, :create, :destroy]
  
  resources :users

  resources :followings, only: [:create, :destroy]

end
