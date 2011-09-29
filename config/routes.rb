BadgesEngine::Engine.routes.draw do

  resources :badges
  
  resources :assertions
  
  match 'a/:id/:token.json' => 'assertions#bake_callback', :via => :get, :defaults => { :format => 'json' }, :as => :secret_assertion
    
  root :to=>'badges#index'
end
