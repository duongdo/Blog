Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root "posts#index"
  get "delete_friend", to: "friends#destroy"
  resources :posts
  resources :users
  resources :comments
  resources :likes
  resources :friends
end
