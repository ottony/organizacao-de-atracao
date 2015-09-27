Rails.application.routes.draw do
  root 'attractions#index'

  resources :attractions, :except => :show do
    collection do
      get '/past', action: 'past', as: 'past'
    end
  end
  
  resources :users, only: [:new, :create, :destroy, :index] do
    member do
      get '/attractions', action: 'attractions', as: 'attractions'
    end
  end

end
