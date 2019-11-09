Rails.application.routes.draw do
  devise_for :user, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :event, only: [:create, :update, :destroy], controller: :events
    post '/event/event_like' => 'events#userLikes?'
    post '/events' => 'events#index'
    post '/event/like' => 'events#like'
    delete '/event/unlike' => 'events#unlike'
  end
end