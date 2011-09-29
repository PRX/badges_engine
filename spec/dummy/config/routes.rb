Rails.application.routes.draw do
  mount BadgesEngine::Engine => '/badges'

  resources :issuers

  resources :users

  resource :session

  root :to=>'users#index'
end
