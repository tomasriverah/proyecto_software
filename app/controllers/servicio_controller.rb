# frozen_string_literal: true

class ServicioController < ApplicationController
  def index
    @servicio = Servicio.all
  end

  def new
    @servicio = Servicio.new
  end

  def create
    @servicio = Servicio.new(servicio_params)
    @servicio.user = current_user

    if @servicio.save
      redirect_to servicio_index_path, notice: 'Servicio creado con exito'
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

  def servicio_params
    params.require(:servicio).permit(:title, :body, :user, :price)
  end
end
