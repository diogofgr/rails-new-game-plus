Rails.application.routes.draw do
  root to: 'pages#home'
  # devise_for :users,
  #   controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :product_offers do
      resources :transactions, only: [:show]
    end
    resources :transactions, only: [:index, :show]
  end

  resources :products, only: [:index, :show] do
    resources :product_offers, only: [:index, :show]
  end

  # get 'transactions/index'

  # get 'transactions/show'

  # get 'product_offers/index'

  # get 'product_offers/show'

  # get 'product_offers/new'

  # get 'product_offers/create'

  # get 'product_offers/edit'

  # get 'product_offers/update'

  # get 'product_offers/destroy'

  # get 'users/show'

  # get 'users/new'

  # get 'users/create'

  # get 'users/edit'

  # get 'users/update'

  # get 'users/destroy'

  # get 'products/index'

  # get 'products/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
