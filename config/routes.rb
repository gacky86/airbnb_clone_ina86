Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home", as: :home

  resources :houses do
    resources :requests, only: :create
  end

  resources :bookmarks, only: [:create, :destroy]
  resources :requests, only: [:index, :destroy, :update]

  get "hosting", to: "pages#hosting", as: :hosting

  get "up" => "rails/health#show", as: :rails_health_check
end
