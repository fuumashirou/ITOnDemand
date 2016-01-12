Rails.application.routes.draw do
  get 'restricted_access/restricted_user'

  devise_for :users
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'home#index'

  namespace :admin do
   root 'home#index'
   resources :services
   get 'user_validation', to: 'validations#index', as: "user_validation"
   get 'show_user_validation/:id', to: 'validations#show', as: "show_user_validation"
   post 'validate_user', to: 'validations#validate_user', as: 'validate_user'
  end

  resources :services, only: [:index, :show]
  post 'suscribe', to: 'services#suscribe', as: 'suscribe'
  get 'unsuscribe/:id/:service_id', to: 'services#unsuscribe', as: 'unsuscribe'
 

end
