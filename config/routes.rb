Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :groups, except: :destroy do
    resources :trails do
      resources :checkpoints, only: :create
    end
    resources :user_groups, only: %i[create update destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
