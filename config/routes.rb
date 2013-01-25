MarchNerdness::Application.routes.draw do

  # root redirect
  root to: 'static_pages#home'

  # omniauth
  match "/auth/:provider/callback", to: 'sessions#create'
  match "/signout", to: 'sessions#destroy', as: :signout
  match "/signin", to: 'sessions#new', as: :signin

  # static pages
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
