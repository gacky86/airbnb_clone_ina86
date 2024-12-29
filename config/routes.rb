Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home", as: :home

  resources :houses do
    resources :requests, only: :create
    # collection do
    #   get :bookmarks
    # end
  end

  resources :bookmarks, only: [:create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
