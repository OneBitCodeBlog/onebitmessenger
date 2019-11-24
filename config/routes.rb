Rails.application.routes.draw do
  devise_for :users
  root to: "chats#index"

  resources :contacts, only: %i(index new create destroy)
  resources :chats, only: %i(index show) do
    resources :messages, only: :create, defaults: { format: :js }
  end
end
