Rails.application.routes.draw do
  root 'sessions#new'

  # resources :activities [only: ]
  resources :guestlists, only: [:new, :create, :destroy]
  resources :interests
  # resources :events do
  #   resources :users
  # end
  resources :users do
    resources :events
  end

  resources :sessions, only: [:new, :create]
  delete "/sessions", to: "sessions#destroy", as: "session"


  get 'events/:id/showevent', to: 'events#showevent', as: 'showevent'
  get '/index2', to: 'events#index2', as: 'index2'
  get '/sessions/logout', to: 'sessions#logout', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
