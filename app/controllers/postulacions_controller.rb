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

    @carrete = Carrete.find(postulacion_params[:carrete_id])
    redirect_to carrete_path(@carrete)
  end

  def send_notificacion(postulacion)
    @carrete = Carrete.find(postulacion.carrete_id)
    postulacions_sorted = @carrete.postulacion.postulaciones { |uid, monto| -monto }
    texto = 'Felicitaciones tu postulación ha sido aceptada, estás invitado a ' + @carrete.title + '.'
    i = 0
    postulacions_sorted.each do |uid, _monto|
      i += 1
      if i > @carrete.capacidad_maxima
        return
      end
      notificiacion = Notification.new
      notificiacion.user_id = uid
      notificiacion.n_text = texto
      notificiacion.is_checked = false
      notificiacion.save
    end
  end

  def close_postulacion
    @postulacion = Postulacion.find(params[:id])
    @postulacion.is_open = 0
    @postulacion.save
    send_notificacion(@postulacion)
  end

  def display; end

  def postulacion_params
    params.require(:postulacion).permit(:carrete_id, :user_id, :monto)
  end
end
