Rails.application.routes.draw do
  devise_for :user, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :event, only: [:create, :update, :destroy], controller: :events
    get '/events' => 'events#index'
  end
end