Rails.application.routes.draw do
  resources :inventories, only: [:index, :show, :edit, :update, :new, :create] do
      resources :inventory_items, only: [:show, :new, :create]
  end

  resources :items, only: [:index, :new, :create, :edit, :update]

  resources :inventory_items, only: [:edit, :update, :new, :create] do
    resources :entries
  end

  resources :categories

  devise_for :users, :controllers =>
    { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "inventories#index"
end
