Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "home#index"

  resources :topics, only: [:show, :new, :create, :index]
  namespace :api, defaults: { format: 'json' } do
    resources :comments, only: [:create]
    resources :topics, only: [] do
      patch :upvote, on: :member
      patch :remove_upvote, on: :member
    end
  end
end

