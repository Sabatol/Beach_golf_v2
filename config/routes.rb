Rails.application.routes.draw do

  devise_for :users
  root to: 'events#index'
  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end
  resources :events do
    resources :pictures, only: [:new, :create]
    resources :charges
    resources :participations, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
