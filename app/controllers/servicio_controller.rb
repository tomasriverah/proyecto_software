# frozen_string_literal: true

class ServicioController < ApplicationController
  before_action :authenticate_user!, only: %i[index admin_index new show edit]
  def index
    @servicio = Servicio.where(status: 'aprobado')
  end

  def admin_index
    @servicio_pendiente = Servicio.where(status: 'pendiente')
  end

  def new
    @servicio = Servicio.new
  end

  def create
    @servicio = Servicio.new(servicio_params)
    @servicio.user = current_user

    if @servicio.save
      redirect_to servicio_index_path, notice: 'Servicio creado con exito y esperando aprobación de admins.'
    else
      render :new
    end
  end

  def show
    @servicio = Servicio.find(params[:id])
  end

  def edit
    @servicio = Servicio.find(params[:id])
  end

  def update
    @servicio = Servicio.find(params[:id])

    if @servicio.update_attributes(servicio_params)
      redirect_to servicio_index_path, notice: 'Servicio editado con exito'
    else
      render 'edit'
    end
  end

  def destroy
    @servicio = Servicio.find(params[:id])
    @servicio.destroy
    redirect_to servicio_index_path, notice: 'Servicio borrado con exito'
  end

  def destroy_from_profile
    @servicio = Servicio.find(params[:id])
    @servicio.destroy
    redirect_to profile_profile_path, notice: 'Servicio borrado con exito'
  end

  def aprobar
    @servicio = Servicio.find(params[:id])
    @servicio.update_attribute(:status, 'aprobado')
    redirect_to servicio_index_path, notice: 'Servicio aprobado'
  end

  def servicio_params
    params.require(:servicio).permit(:title, :body, :user, :price, :status, comuna_ids: [])
  end
end
