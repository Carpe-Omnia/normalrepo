Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'gaysex#homepage'
  get '/founder', to: 'gaysex#founder'

  get '/register', to: 'users#new' 
  get '/login', to: 'users#login'
  post '/login', to: 'users#authorize' 
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/logout', to: 'users#logout' 
  
  get '/jokes', to: 'jokes#index'
  get '/jokes/new', to: 'jokes#new' 
  post '/jokes', to: 'jokes#create' 
  
end
