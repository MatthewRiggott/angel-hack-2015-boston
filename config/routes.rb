Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :recommendations

  resources :accepts, only: [:index, :destroy]

  resources :user_recommendations, only: [:create]
end
