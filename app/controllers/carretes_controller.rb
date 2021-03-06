# frozen_string_literal: true

class CarretesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit index show]
  def new
    @carrete = Carrete.new
  end

  def create
    @carrete = Carrete.new(carrete_params)
    @carrete.user = current_user

    if @carrete.save
      @postulacion = Postulacion.new
      @postulacion.update_carrete_id(@carrete.id)
      @postulacion.save
      redirect_to carretes_index_path, notice: 'Carrete creado con exito'
    else
      render :new
    end
  end

  def index
    @carrete = if params[:filter]
                  if (params[:precio_min] != "")
                    Carrete.where('comuna_id=' + params[:comunas_id] + ' AND ' +  'min_price >' + params[:precio_min])
                  else
                    Carrete.where(comuna_id: params[:comunas_id] )
                  end
               else
                 Carrete.all
               end
    @carrete
  end

  
  def show
    @carrete = Carrete.find(params[:id])
    id_carrete = @carrete.id.dup
    @postulacion = Postulacion.find_by(carrete_id: id_carrete)
    @monto = 0
    @postulacion.postulaciones.each do |_key, value|
      @monto += value.to_i
    end
  end

  def services
    @carrete = Carrete.find(params[:id])
    @comuna = Comuna.find(@carrete.comuna_id)
    @servicio = @comuna.servicios
  end

  def edit
    @carrete = Carrete.find(params[:id])
  end

  def update
    @carrete = Carrete.find(params[:id])
    if params[:carrete][:servicio]
      @carrete.servicios << Servicio.find(params[:carrete][:servicio])
    end
    if @carrete.update_attributes(carrete_params)
      redirect_to carretes_index_path, confirm: 'Carrete editado con exito'
    else
      render 'edit'
    end
  end

  def mark_done
    @carrete = Carrete.find(params[:id])
    @carrete.done = true
    @carrete.save
  end

  def destroy
    @carrete = Carrete.find(params[:id])
    @carrete.destroy
    redirect_to carretes_index_path, notice: 'Carrete borrado con exito'
  end

  def destroy_from_profile
    @carrete = Carrete.find(params[:id])
    @carrete.destroy
    redirect_to profile_profile_path, confirm: 'Carrete borrado con exito'
  end

  def carrete_params
    params.require(:carrete).permit(:title, :body, :fecha, :comuna_id, :direccion,
                                    :capacidad_maxima, :user, :max_price, :min_price)
  end
end
