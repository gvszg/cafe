Rails.application.routes.draw do
  
  devise_for :users

  namespace :admin do 
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end

    resources :items, :controller => "cart_items"
    
  end

  resources :orders do
    member do
      get 'pay_with_credit_card'
    end
  end

  namespace :account do 
    resources :orders
  end

  root :to => "products#index"

end
