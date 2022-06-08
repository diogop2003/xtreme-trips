Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trails, except: :destroy do
    resources :events, only: %i[index new create]
  end
  resources :events, only: %i[show edit update destroy]
end
