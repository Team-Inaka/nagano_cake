Rails.application.routes.draw do
  # resources :cart_items
  # resources :carts, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders,only:[:new,:create,:index,:show]


  # get 'costomers/index'
  # get 'costomers/show'
  # get 'costomers/edit'



# 3782311ff1cdb6778024e8fd68187ebed5c72e4d
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
  }
    # devise_scope :admin do
  #   get 'admins/sign_in' => 'admins/sessions#new',as: 'new_admin_session'
  #   post 'admins/sign_in' => 'admins/sessions#create',as: 'admin_session'
  #   delete 'admins/sign_out' => 'admins/sessions#destroy',as:'destroy_admin_session'
  # end
   devise_for :costomers, controllers: {
    registrations: 'costomers/registrations',
    sessions: "costomers/sessions",
   }
   #  :controllers => {
   #    :registrations => 'costomers/registrations',
   #    :sessions => 'costomers/sessions',
   #    :passwords => 'costomers/passwords'
   #  }
  devise_scope :costomer do
    post 'costomers/sign_up/confirm' => 'costomers/registrations#confirm'
  end
  # devise_for :costomers, skip: :all
  # devise_scope :cosotomer do
  get 'costomers/sign_in' => 'costomers/sessions#new'
  post'costomers/sign_in' => 'costomers/sessions#create'
  #   delete 'costomers/sign_out' => 'costomers/sessions#destroy'
  #   get 'costomers/sign_up' => 'costomers/registrations#new'
  #   post 'costomers' => 'costomers/registrations#create'
  #   get 'costomers/password/new' => 'costomers/passwords#new'
  # get 'cosotmers/sign_up/confirm' => 'costomers/registrations#confirm'
  # post 'cosotmers/sign_up/confirm' => 'costomers/registrations#confirm'
  # put "/costomers/:id/hide" => "costomers#hide", as: 'costomers_hide'
  # end
  namespace :costomers do
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]
    resources :products, only: [:index, :show]
    resources :costomers, only: [:show, :edit, :update]
    resources :cart_items, except:[:index, :show, :new, :edit]
    resources :carts, except:[:index]
    get "/costomers/costomer/withdraw" => "costomers#withdraw"
    put "/costomers/costomer/:id/hide" => "costomers#hide", as: 'costomers_hide'
  end
  root "costomers/homes#top"
  resources :products, only: [:index, :show]
  namespace :admins do
      resources :genres, only:[:index,:edit,:update,:create]
      resources :products, except: [:destroy]
  end
  resources :products, only: [:index, :show]
  resources :products, only: [:index, :show],param: :id
  # devise_scope :costomer do
  # post 'cosotmers/sign_up/confirm' => 'costomers/registrations#confirm'
  # end
  # put "/costomers/:id/hide" => "costomers#hide", as: 'costomers_hide'd
#   devise_for :admins, controllers: {
#   sessions: 'admins/sessions'
# }
  # resources :products, only: [:index, :show],params: :id
  namespace :admins do
    resources :ordered_products, only:[:index,:show]
    resources :orders, only:[:index, :show, :update]
    patch "ordered_products/:id/order_update" => "ordered_products#order_update", as: 'order_update'
    patch "ordered_products/:id/production_update" => "ordered_products#production_update"
    resources :costomers, only:[:index,:show,:edit,:update]
    resources :genres, only:[:index,:edit,:update,:create]
    resources :products, except: [:destroy]
    get "admins/homes" => "homes#top"
  end
end
