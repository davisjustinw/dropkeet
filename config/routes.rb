Rails.application.routes.draw do

  resources :item_tags
  resources :template_tags
  resources :entry_tags
  resources :tags
  resources :entries
  resources :inventory_items
  resources :items
  resources :location_users
  resources :locations
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "welcome#home"

end
