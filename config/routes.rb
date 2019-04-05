Rails.application.routes.draw do
  resources :places
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'gaysex#homepage'
  get '/founder', to: 'gaysex#founder'
  get '/sample', to: 'gaysex#testing'

  get '/register', to: 'users#new'
  get '/login', to: 'users#login'
  post '/login', to: 'users#authorize'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/profile', to: 'users#profile'
  get '/logout', to: 'users#logout'

  get '/jokes', to: 'jokes#index'
  get '/jokes/new', to: 'jokes#new'
  post '/jokes', to: 'jokes#create'
  get 'jokes/:id', to: 'jokes#show'
  post 'jokes/:id', to: 'jokes#comment'

  post '/bio', to: 'bios#create'
  patch '/bio.:id', to: 'bios#update', as: 'bios'
  patch '/bio/:id', to: 'bios#update'

  get '/messages/new', to: 'messages#new'
  get '/messages', to: 'jokes#index'
  post '/messages', to: 'messages#create'
  get '/inbox', to: 'messages#inbox'
  post '/reply', to: 'messages#sendreply'
  post '/conversation', to: 'messages#conversation'

  
end
