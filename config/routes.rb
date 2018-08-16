Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  mount Ckeditor::Engine => '/ckeditor'
  get 'users/show'
  devise_for :users
  get "tags/show"
  get "static_pages/home"

  resources :categories, only: :show
  resources :posts, param: :slug do
    resources :comments
    resources :post_clips, only: :create
  end
  resources :tags, only: :show
  resources :users, only: :show
  resources :notifications, only: %i(index) do
    collection do
      post :make_as_read
    end
  end

  get "/notifications/read_all", to: "notifications#read_all", as: "notifications_list"
  namespace :admin do
    resources :posts
  end
  root "static_pages#home"
end
