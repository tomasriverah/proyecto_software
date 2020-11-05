# frozen_string_literal: true

Rails.application.routes.draw do
  get 'settings/display'
  get 'settings/index'
  get 'settings/display', to: 'settings#display', as: 'settings'
  get 'settings/new'
  get 'settings/edit'
  get 'comunas/index'
  get 'comunas/show'
  get 'comunas/new'
  get 'comunas/edit'
  get 'servicio/index'
  get 'servicio/new'
  get 'servicio/show'
  get 'servicio/edit'
  get 'carretes/new'
  get 'carretes/index'
  get 'carretes/show'
  get 'carretes/edit'
  get 'profile/profile'
  get 'home_page/home'

  resources :comunas

  put 'go_to_profile' => 'profile#profile'
  get 'profile/redir'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  match '/users/:id' => 'profile#make_admin', :via => :get
  match '/profile/blabla' => 'profile#make_service', :via => :get
  match '/users/:id' => 'profile#destroy', :via => :delete, :as => :user

  post 'postulacion' => 'postulacions#postular'

  resources :carretes do
    resources :comentarios
    resources :postulacion
    # get 'carretes/:id/comentarios_carrete'
  end

  resources :servicio do
    resources :servicecomments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home_page/home'
  root 'home_page#home'
end
