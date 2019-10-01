Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :topics, only: [:show, :new, :create, :index]
  namespace :api do
    resources :topics, only: [] do
      patch :upvote, on: :member
      patch :remove_upvote, on: :member
    end
  end
end

