Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root "posts#index"
  resources :posts
  resources :users
  resources :comments
end
