# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    @users = User.all
    @carretes = Carrete.where(user_id: current_user.id)
    @servicios = Servicio.where(user_id: current_user.id)
  end

  def make_service
    @user = current_user
    @user.update_role(3)
    redirect_to root_url, notice: 'Usuario es proveedor de servicio.'
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_role(2)
    redirect_to root_url, notice: 'Usuario es Administrador.'
  end

  def add_descripcion
    @descripcion = UserDescripcion.find_by(user_id: params[:user_id])
    if @descripcion
      @descripcion.descripcion = params[:descripcion]
      @descripcion.save
    else
      @descripcion = UserDescripcion.new
      @descripcion.user_id = params[:user_id]
      @descripcion.descripcion = params[:descripcion]
      @descripcion.save
    end
  end

  def recordatorio; end

  def destroy
    ### https://stackoverflow.com/questions/21192949/deleting-users-in-devise-generated-model referencia
    @user = User.find(params[:id]).destroy
    @user.destroy
    redirect_to root_url, notice: 'Usuario eliminado.' if @user.destroy
  end

  def redir
    redirect_to home_page_home_path
  end
end
