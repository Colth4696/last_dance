Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  get '*path', to: "application#fallback_index_html", constraints: -> (request) do !request.xhr? && request.format.html?

  resources :users, only: [:create, :show, :index]
  resources :requests
  resources :chatrooms, only: [:index, :show, :create]
  resources :messages, only: [:index, :create]
  resources :volunteers

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
end
