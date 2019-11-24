Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :contacts, only: %i(index new create destroy)
  resources :chats, only: %i(index show)
end
