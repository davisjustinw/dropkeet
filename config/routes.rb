Rails.application.routes.draw do

  resources :item_hash_tags
  resources :hash_tags
  resources :inventory_users
  resources :inventories
  resources :customers
  resources :scissors
  resources :rocks
  resources :papers
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
