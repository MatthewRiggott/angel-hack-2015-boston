Rails.application.routes.draw do
  resources :recommendations
  root 'homes#index'
  devise_for :users

end
