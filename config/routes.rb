Rails.application.routes.draw do

    devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

    root to: 'main#index'

    resources :product, only: [:show]

    resources :category, only: [:show]

    resource :cart, only: %i[destroy show] do
      resources :items, only: %i[dectroy create]
    end

    resources :search, only: [:index]
end
