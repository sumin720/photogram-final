Rails.application.routes.draw do
  root "photos#index"

  resources :photos do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show] do
    member do
      get :feed
      get :liked_photos
      get :discover
    end
  end

  resources :follow_requests, only: [:create, :destroy]
end
