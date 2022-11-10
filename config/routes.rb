Rails.application.routes.draw do
  resources :spaces
  resources :sites
  resources :portfolios

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
    resource :user, only: [:show, :update]

    resources :portfolios do
      resources :sites do
        resources :spaces
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
