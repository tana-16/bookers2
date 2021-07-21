Rails.application.routes.draw do
  devise_for :user
  root to: 'homes#top'
  get 'homes/about'
  # get 'homes/about' => 'homes#show'
  # get 'users/show'

  # resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:index, :show, :edit, :update]


  resources :books
  # post 'books' => 'books#create'

end
