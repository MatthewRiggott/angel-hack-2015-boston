Rails.application.routes.draw do
  resources :recommendations
  root 'homes#index'
  get '/map', to:'recommendations#map'

  devise_for :users

end
