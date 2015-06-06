Rails.application.routes.draw do
  resources :recommendations
  root 'homes#index'
<<<<<<< HEAD
  get '/map', to:'recommendations#map'

  devise_for :users

=======
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
>>>>>>> master
end
