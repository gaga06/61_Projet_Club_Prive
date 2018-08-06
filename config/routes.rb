Rails.application.routes.draw do


root to:  'static_pages#home', as: :home

get 'home', to: 'static_pages#home'

  resources :users
  get 'signup', to: 'users#new', as: :signup
  get 'users', to: 'users#index', as: :club
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
