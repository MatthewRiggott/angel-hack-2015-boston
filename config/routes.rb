Rails.application.routes.draw do
  resources :recommendations
  resources :user_recommendations
  root 'homes#index'
  get '/map', to:'recommendations#map'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
