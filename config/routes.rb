Rails.application.routes.draw do
  root to: 'homes#top'
  # get 'users/show'
  #devise_for :users
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  
  resources :users, only: [:show]

end
