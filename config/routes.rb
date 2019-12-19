Rails.application.routes.draw do
  resources :inventories, only: [:index, :show, :edit, :update, :new, :create] do
      resources :inventory_items, only: [:show]
  end

  resources :items, only: [:index, :new, :create, :edit, :update]

  resources :inventory_items, only: [:edit, :update, :new, :create] do
    resources :entries
  end

  devise_for :users, :controllers =>
    { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "inventories#index"
end
