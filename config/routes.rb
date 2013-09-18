Strasbourgstartups::Application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :startups
  resources :headlines

  get 'about' => 'content#about'

  root 'startups#index'
end
