Rails.application.routes.draw do
  get '/top', to: 'static_pages#top'
  get '/signup', to: 'users#new'
  resources :users, only: [:create]

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  namespace :admin do
    resources :users
  end
  resources :memos
  root 'memos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
