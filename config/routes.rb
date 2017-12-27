Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      use_doorkeeper do
        skip_controllers :authorizations, :applications, :authorized_applications
        controllers tokens: 'tokens'
      end

      resources :sounds, only: [:index]
      resources :favourite_sounds, only: [:index, :create, :destroy]
      resources :directories, only: [:index, :create, :show, :destroy] do
        resource :favourite_sounds, only: [:create, :destroy], module: 'directories'
      end
    end
  end
end
