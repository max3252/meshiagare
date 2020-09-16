Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'messages/new'
  root to: "posts#index"
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :messages, only: [:new, :create]
  resources :users, only: [:show]
end
