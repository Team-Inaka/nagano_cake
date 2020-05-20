Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :costomers, controllers: {
  sessions: 'costomers/sessions',
  registrations: 'costomers/registrations'
}
  resources :costomers, only: [:show]
  put "/costomers/:id/hide" => "costomers#hide", as: 'costomers_hide'

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  root "homes#top"

  namespace :admins do
      resources :genres, only:[:index,:edit,:update,:create]
  end

  resources :products, only: [:index, :show]
  namespace :admins do
      resources :products, except: [:destroy]
  end

end

