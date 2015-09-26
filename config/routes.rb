Rails.application.routes.draw do
  root 'attractions#index'

  resources :attractions, :except => :show
  
  resources :users, only: [:new, :create, :destroy, :index] do
    member do
      get '/attractions', action: 'attractions', as: 'attractions'
    end
  end

end
