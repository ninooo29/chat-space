Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups, only: [:new, :edit, :create, :update] do
    resources :messages, shallow: true
  end
end
