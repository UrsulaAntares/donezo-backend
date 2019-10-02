Rails.application.routes.draw do
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

  

  resources :users, only: [:create]
  # post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
