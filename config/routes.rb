Rails.application.routes.draw do

  resources :shipping_addresses, only:[:index, :create, :edit, :update, :destroy]

end

