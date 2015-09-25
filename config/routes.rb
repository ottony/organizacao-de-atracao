Rails.application.routes.draw do
  root 'attractions#index'

  resources :attractions, :except => :show
end
