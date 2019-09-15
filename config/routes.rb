Rails.application.routes.draw do
  devise_for :users
  root  'posts#index'
  resources :posts, only: [:new, :create, :update, :destroy, :edit]
  resources :users, only: [:show]
end
