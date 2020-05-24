Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "orders/confirm" => "orders#confirm"
  get "orders/complete" => "orders#complete"
  resources :orders,only:[:new,:create,:index,:show]
  
  namespace :admins do
    resources :ordered_products, only:[:index,:show]
    patch "ordered_products/:id/order_update" => "ordered_products#order_update", as: 'order_update'
    patch "ordered_products/:id/production_update" => "ordered_products#production_update"
  end

  namespace :admins do
    resources :orders, only:[:index, :show, :update]
  end
  
  devise_for :costomers, controllers: {
  sessions: 'costomers/sessions',
  registrations: 'costomers/registrations'
}
  resources :costomers, only: [:show]
  put "/costomers/:id/hide" => "costomers#hide", as: 'costomers_hide'

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]

  root "homes#top"



  resources :products, only: [:index, :show]
  namespace :admins do
      resources :genres, only:[:index,:edit,:update,:create]
      resources :products, except: [:destroy]
  end

  resources :products, only: [:index, :show]

  resources :products, only: [:index, :show],param: :id

  namespace :admins do
      resources :genres, only:[:index,:edit,:update,:create]
      resources :products, except: [:destroy]
  end

end

