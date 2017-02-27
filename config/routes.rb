Rails.application.routes.draw do

  root "groups#index"

  devise_for :users

  resources :groups, only: [:new, :edit, :create, :update] do
    resources :messages, shallow: true, only: [:index, :create]
  end
  resources :users, only: [:index]
end
