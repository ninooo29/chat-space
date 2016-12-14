Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :chat_groups, only: [:new, :edit]
end
