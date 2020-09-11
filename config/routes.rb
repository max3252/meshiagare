Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :messages, only: [:new, :create]

end
