DataVaultClient::Application.routes.draw do
  #match '/auth/:provider/callback', to: 'sessions#create'
  #match '/signout', to: 'sessions#destroy', as: 'signout'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  resources :stored_data
  root to: 'stored_data#index'
end
