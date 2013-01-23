MarchNerdness::Application.routes.draw do

  # root redirect
  root to: 'static_pages#home'

  # static pages
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
