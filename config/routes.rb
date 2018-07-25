Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  mount Ckeditor::Engine => '/ckeditor'
  get 'users/show'
  devise_for :users
  get "tags/show"
  get "static_pages/home"

  resources :categories, only: :show
  resources :posts do
    resources :comments
    resources :post_clips, only: :create
  end
  resources :tags, only: :show
  resources :users, only: :show

  namespace :admin do
    resources :posts
  end
  root "static_pages#home"
end
