Rails.application.routes.draw do

  root to: 'static_pages#home'
  resources :fights, only: [:new, :create, :show]
  resources :pokemons, only: [:show, :new, :create, :index]
  
end
