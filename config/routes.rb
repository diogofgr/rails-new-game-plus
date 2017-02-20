Rails.application.routes.draw do
  get 'product_offers/index'

  get 'product_offers/show'

  get 'product_offers/new'

  get 'product_offers/create'

  get 'product_offers/edit'

  get 'product_offers/update'

  get 'product_offers/destroy'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'products/index'

  get 'products/show'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
