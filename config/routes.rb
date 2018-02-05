Rails.application.routes.draw do
  get '/login', to: 'sessions#new' #j'active la fonction new
	
  post '/login', to: 'sessions#create' #pour créer la session
	
  delete '/logout', to: 'sessions#destroy' #pour detruite, j'active la fonction delete
  get '/logout', to: 'sessions#destroy'

  root to: 'static_pages#home'

  get 'static_pages/secret_page', to: 'static_pages#secret_page'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

  post   '/users/:id/edit(.:format)',   to: 'users#edit'

  get 'users/:id/users/destroy', to: 'users#destroy'
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
