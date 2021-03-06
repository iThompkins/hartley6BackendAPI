Rails.application.routes.draw do
  devise_for :user, only: []
  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :sign_up, only: [:create, :update], controller: :users
    resource :event, only: [:create, :update, :destroy], controller: :events
    post '/event/event_like' => 'events#userLikes?'
    post '/events' => 'events#index'
    post '/event/like' => 'events#like'
    post '/event/group' => 'events#getGroup'
    delete '/event/unlike' => 'events#unlike'
  end
end