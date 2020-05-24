Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'    
  end

  devise_scope :costomer do 
  post 'cosotmers/sign_up/confirm' => 'costomers/registrations#confirm'
  end

  resources :costomers, only: [:show]
  put "/costomers/:id/hide" => "costomers#hide", as: 'costomers_hide'

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}


resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]

  root "homes#top"

  resources :products, only: [:index, :show],param: :id
  namespace :admins do
      resources :genres, only:[:index,:edit,:update,:create]
      resources :products, except: [:destroy]
  end

end

