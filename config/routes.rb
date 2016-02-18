Rails.application.routes.draw do

  root to: 'static_pages#home'
  resource :fight, only: [:new, :create, :show]
  resource :pokemon, only: [:show, :new, :create] do
    resources :fights, only: [:index]
  end
  
end
