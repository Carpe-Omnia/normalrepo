Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'gaysex#homepage'
  get '/jokes', to: 'gaysex#jokes'
  get '/founder', to: 'gaysex#founder'
end
