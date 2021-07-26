Rails.application.routes.draw do
  root to: 'homes#top'
  get "home/about" => "homes#about"

  devise_for :users
  # get 'homes/about' => 'homes#show'
  # get 'users/show'

  # resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:index, :show, :edit, :update]


  resources :books
  # post 'books' => 'books#create'

end
