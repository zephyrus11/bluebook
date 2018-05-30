Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :tasks


  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/tasks/:id/edit' => "tasks#edit"
  post '/tasks/:id/edit' => "tasks#update"
  delete '/tasks/:id' => "tasks#destroy"
  root 'tasks#index'
end
