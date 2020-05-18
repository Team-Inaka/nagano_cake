Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders,only:[:new,:create,:index,:show]
  post "orders/confirm" => "orders#confirm"
  get "orders/complete" => "orders#complete"

end

