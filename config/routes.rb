Rails.application.routes.draw do

  resources :inventories, only: [:index, :show, :edit, :new, :create]

  resources :items, only: [:edit]

  resources :inventory_items, only: [:index, :edit, :update, :new, :create]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "welcome#home"

end
