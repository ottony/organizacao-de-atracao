Rails.application.routes.draw do
  root 'attractions#index'

  resources :attractions, :except => :show
  resources :users,
    :controller => 'users',
    :only => [:new, :create, :destroy, :index]

end
