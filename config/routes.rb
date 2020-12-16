Rails.application.routes.draw do
  Rails.application.routes.draw do
    root to: 'main#index'

    resources :product, only: [:show]

    resources :category, only: [:show]

    resources :search, only: [:index]
  end
end
