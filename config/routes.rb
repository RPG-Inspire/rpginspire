Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "home#index"

  resources :topics do
    post :validate_step, on: :collection
    get :edit_tag, on: :member
  end

  namespace :api, defaults: { format: 'json' } do
    resources :comments, only: [:create]
    resources :topics, only: [] do
      patch :upvote, on: :member
      patch :remove_upvote, on: :member
    end
  end
end

