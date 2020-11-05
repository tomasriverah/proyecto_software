# frozen_string_literal: true

class PostulacionsController < ApplicationController
  def new
    @postulacion = Postulacion.new
  end

  def create
    @carrete = Carrete.find(params[:carrete_id])
    @postulacion = Postulacion.new

    @postulacion.carrete_id = @carrete.get_id
    @postulacion.save
    redirect_to carrete_path(@carrete)
  end

  def postular
    @postulacion = Postulacion.find(params[:postulacion][:id])
    @postulacion.postulaciones[params[:postulacion][:user_id]] = params[:monto]
    @postulacion.save
  end

  def display; end

  def postulacion_params
    params.require(:postulacion).permit(:carrete_id, :user_id, :monto)
  end
end
