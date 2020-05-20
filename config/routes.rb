Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders,only:[:new,:create,:index,:show]
  post "orders/confirm" => "orders#confirm"
  get "orders/complete" => "orders#complete"
  

  devise_for :costomers, controllers: {
  sessions: 'costomers/sessions',
  registrations: 'costomers/registrations'
}
  resources :costomers
  put "/costomers/:id/hide" => "costomers#hide", as: 'costomers_hide'

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  # get 'home#top'

  # resources :customers
  # get "customers/confirm" => "customers#confirm"
  # patch "customers/:id/hide" => "customers#hide"

  # resources :products,only: [:index,:show]
  # resources :cart_items,except:[:new,:edit,:show]
  # post "cart_items/add_item" => "cart_items#add_item"
  # delete "cart_items/:id" => "cart_items#destroy"

  # resources :orders,only:[:new,:create,:index,:show]
  # get "orders/confirm" => "orders#confirm"
  # post "orders" => "orders#create"
  # get "orders/complete" => "orders#complete"

  # resources :shipping_address,only:[:index,:create,:edit,:update]

  # get 'admin_homes#top'

  # resources :admin_products,except:[:destroy]
  # resources :admin_genres,only:[:index,:edit,:update,:create]
  # resources :admin_customers,only:[:index,:show,:edit,:update]
  # resources :admin_ordered_products,:only[:index,:show]
  # patch "admin_ordered_products/:id/order_update" => "admin_ordered_products#order_update"
  # patch "admin_ordered_products/:id/production_update" => "admin_ordered_products#production_update"
end

