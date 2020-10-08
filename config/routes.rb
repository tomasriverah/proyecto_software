# frozen_string_literal: true

Rails.application.routes.draw do

  get 'profile/profile'
  get 'home_page/home'

  put "go_to_profile" => "profile#profile"
  get  "profile/redir"


  devise_for :users, controllers: {    
  sessions: 'users/sessions'
  }
  match '/users/:id' => 'profile#make_admin', :via => :get
  match '/profile/blabla' => 'profile#make_service', :via => :get
  match '/users/:id' => 'profile#destroy', :via => :delete, :as => :user

  resources :post do
  	resources :comentarios
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'home_page/home'
  root 'home_page#home'
 
  end
