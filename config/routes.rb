Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect('/login')

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  namespace :user do
    resources :books
  end

  resources :books, only: [:index]
  resources :users

end
