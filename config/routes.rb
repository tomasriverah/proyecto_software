# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin/new_admin'
  post 'admin/new_admin', to: 'admin#make_admin'
  get 'settings/display', to: 'settings#display', as: 'settings'
  get 'carretes/services'
  delete 'servicio/destroy_from_profile', to: 'servicio#destroy_from_profile'
  delete 'carretes/destroy_from_profile', to: 'carretes#destroy_from_profile'
  get 'settings/display'
  get 'settings/index'
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
  get 'carretes/filter'
  get 'profile/profile'
  get 'profile/add_descripcion'
  get 'home_page/home'
  get 'postulacions/close_postulacion'
  get 'carretes/mark_done'

  resources :comunas
  resources :admin

  put 'go_to_profile' => 'profile#profile'
  get 'profile/redir'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  match '/users/:id' => 'profile#make_admin', :via => :get
  match '/profile/blabla' => 'profile#make_service', :via => :get
  match '/users/:id' => 'profile#destroy', :via => :delete, :as => :user

  post 'postulacion' => 'postulacions#postular'
  post 'add_descrpicon' => 'prfoile#add_descripcion'

  resources :carretes do
    resources :comentarios
    resources :postulacion
    # get 'carretes/:id/comentarios_carrete'
  end

  get '/servicio/admin_index' => 'servicio#admin_index'
  get '/servicio/aprobar' => 'servicio#aprobar'

  resources :servicio do
    resources :servicecomments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home_page/home'
  root 'home_page#home'
end
