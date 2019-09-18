Rails.application.routes.draw do
  resources :action_tags
  resources :action_checklists
  resources :tags
  resources :checklists
  resources :environments
  resources :conditionals
  resources :actions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
