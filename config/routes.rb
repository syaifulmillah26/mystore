Rails.application.routes.draw do
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'

  resources :email_confirmation, only: [:new] do
    member do
      get :confirm_email
    end
  end
  root to: 'root#index'
  post '/login', to: 'spree/user_sessions#new'
  Spree::Core::Engine.routes.draw do
    namespace :admin do
      #validating user account
      get '/users/:id/validate', to: "users#validate", as: :validate_user

      # settings
      resources :headers
      resources :abouts
      resources :footers
      resources :testimonies do
        collection do
          post :update_positions
        end
      end
    end
    # namespace :user_sessions do
    #   get '/:token/confirm_email', to: "spree/user_sessions#confirm_email", as: :confirm_email
    # end

    # resources :sessions do
    #   collection do
    #     get '/:token/confirm_email', to: "user_sessions#confirm_email", as: :confirm_email
    #   end
    # end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
