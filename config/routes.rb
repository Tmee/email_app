Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :create, :show]
  post 'send_email', to: 'users#send_email'

  get '/login', to: 'sessions#new',  :as => :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
