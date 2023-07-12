Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [ :index, :show, :destroy, :create ] do
        post 'like', on: :member
      end
      post 'login', to: 'sessions#login', as: :login
    end
  end

  namespace :admin do
    resources :users, only: [ :index, :destroy ]
    resources :posts, only: [ :index, :destroy ]
  end
end
