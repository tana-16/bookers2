Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  # get 'homes/about' => 'homes#show'
  # get 'users/show'
  devise_for :users

  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show]

  # resources :books

end
