Snootysubmit::Application.routes.draw do

  # Session Routes
  resources :user_sessions

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  resources :users, :except => [:index,:new,:show,:destroy]

  match 'signup' => 'cocktails#new', :as => :signup

  # Cocktail Resources
  resources :cocktails

  # Root
  root :to => "front#index"

end
