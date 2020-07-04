Rails.application.routes.draw do
  # root "desktop#desktop"
  root "opinions#index"
  get :desktop, to: "desktop#desktop", as: 'desktop'

  resources :sessions, only: [:new, :create, :destroy]

  resources :opinions
  
  resources :users

end
