Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trails, except: :destroy do
    resources :checkpoints, only: %i[create]
    resources :events, only: %i[index new create]
  end
  resources :events, only: %i[show edit update destroy]
  resources :event_users, only: %i[create]
  get "my_events", to: "events#my", as: "my_events"
end
