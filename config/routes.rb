Rails.application.routes.draw do
  resources :deed_shoppings
  resources :shoppings
  resources :deed_tags
  resources :deed_checklists
  resources :tags
  resources :checklists
  resources :environments
  resources :conditionals
  resources :deeds
  resources :users

  # post '/deeds', to: 'deed#create'


  get '/users/:username', to: 'users#show'
  get '/environments/:name', to: 'environments#show'
  get '/tags/:name', to: 'tags#show'
  get '/deeds/:id', to: 'deeds#show'
  get '/shoppings/:title', to: 'shoppings#show'
  # delete '/shoppings/:title', to: 'shoppings#delete'
  # # destroy '/shoppings/:title', to: 'shoppings#delete'
  # delete '/shoppings/:title', to: 'shoppings#destroy'
  # destroy '/shoppings/:title', to: 'shoppings#destroy'

  

  resources :users, only: [:create]
  # post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
