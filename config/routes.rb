Rails.application.routes.draw do
  root "desktop#desktop"
  get :desktop, to: "desktop#desktop", as: 'desktop'

  resources :sessions, only: [:new, :create, :destroy]

  resources :opinions
  
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end