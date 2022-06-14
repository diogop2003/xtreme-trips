Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trails, except: :destroy do
    resources :checkpoints, only: %i[create new]
    resources :events, only: %i[index new create]
  end
  resources :events, only: %i[show edit update destroy] do
    resources :messages, only: :create
  end
  resources :event_users, only: %i[create]
  get "my_events", to: "events#my", as: "my_events"
  get "my_trails", to: "trails#my", as: "my_trails"
end
