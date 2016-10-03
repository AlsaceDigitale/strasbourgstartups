Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  namespace :admin, path: 'extranet' do
    resources :users do
      collection do
        get :new_invitation
        post :create_invitation
      end
    end
    resources :startups do
      resources :job_offers
    end
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

  get ':id', to: 'pages#show', as: :extra_page
end
