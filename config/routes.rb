Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  get "tags/show"
  get "static_pages/home"

  resources :categories, only: :show
  resources :posts, only: %i{index show}
  resources :tags, only: :show
  resources :users, only: :show
  root "static_pages#home"
end
