Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trails, except: :destroy do
    resources :events
  end
  get "my_events", to: "events#my", as: "my_events"
end
