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
    resources :pages

    root to: "startups#index"
  end

  resources :startups
  resources :headlines
  resources :events
  resources :pages

  root to: "welcome#show"

  get '/about', to: redirect('/a-propos')

  get ':id', to: 'pages#show', as: :extra_page
end
