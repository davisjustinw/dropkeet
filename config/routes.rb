Rails.application.routes.draw do

  resources :inventories do
    resources :items
  end

  resources :items do
    resource :inventories
  end

  resources :inventory_items, only: [:index]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "welcome#home"

end
