Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :groups, only: [:new, :edit, :create, :update]
end
