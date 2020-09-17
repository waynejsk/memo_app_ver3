Rails.application.routes.draw do
root 'memos#index'
resources :memos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
