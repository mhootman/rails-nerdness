MarchNerdness::Application.routes.draw do

  # user pages
  resources :users

  # sessions
  resources :sessions, only: [:new, :create, :destroy]

  # root redirect
  root to: 'static_pages#home'

  # sign up/in/out
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  # static pages
  match '/help',     to: 'static_pages#help'
  match '/about',    to: 'static_pages#about'
  match '/contact',  to: 'static_pages#contact'
  match '/team_api', to: 'static_pages#team_api'

end
