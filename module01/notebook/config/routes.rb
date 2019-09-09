Rails.application.routes.draw do
  
  get '/bemvindo' => 'home#index'

  root 'home#index'
  
  resources :phones
  resources :addresses
  resources :contacts
  resources :kinds # cria 8 rotas de forma automática
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
