Rails.application.routes.draw do
  

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/tasks/new', to: 'tasks#new'
  get 'tasks/index', to: 'tasks#index'
  get '/tasks/:id', to: 'tasks#show', as: :task
  
  resources :users
end
