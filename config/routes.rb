Rails.application.routes.draw do
  root to: 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: %i[new create destroy]
  resources :home, only: %i[index]
end
