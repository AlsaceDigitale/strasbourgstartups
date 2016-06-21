Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  namespace :admin do
    resources :users do
      collection do
        get :new_invitation
        post :create_invitation
      end
    end
    resources :startups
    resources :headlines
    resources :events

    root to: "startups#index"
  end

  resources :startups
  resources :headlines
  resources :events

  root to: "welcome#show"
end
