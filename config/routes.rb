Rails.application.routes.draw do
  get 'articles/new'

  post 'articles/create'

  get 'articles/destroy'

  get '/articles/:id', to: 'articles#show'

  root 'page#index'
  
  resources :users
  
  post 'users/create'
  
  get 'sessions/new'
  
  post 'sessions/create'
  
  get 'sessions/destroy'
  
  get 'page/index'
  
  get 'page/search'
end
