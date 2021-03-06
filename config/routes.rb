Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  } 
  resources :companies
  resources :users, only: [:index, :show] do
    resources :usersfood, only: [:index, :show, :create, :destroy]
    resources :usershobby, only: [:index, :show, :create, :destroy]
  end
  resources :teams
  resources :hobbies
  resources :foods

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
