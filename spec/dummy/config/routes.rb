Rails.application.routes.draw do

  mount BadgesEngine::Engine => '/badges', :as => 'badges'

  resources :users

  resource :session

  root :to=>'users#index'
end
