Swt::Application.routes.draw do
  resources :attendances
  resources :bonuses
  resources :project_types
  resources :source_code_files
  resources :pictures
  resources :comments
  resources :thumbs
  resources :users
  resources :submissions
  resources :projects
  resources :upload


  match 'studio/login'
  match 'studio/index'
  match 'studio/logout'

  # match ':controller/:action/:id'
  match ':controller(/:action(/:id))(.:format)'
  root :to => 'studio#index'

end
