# frozen_string_literal: true

class ComentariosController < ApplicationController
  def create
    @carrete = Carrete.find(params[:carrete_id])
    @comentario = @carrete.comentarios.create(comentario_params)

    @comentario.user = current_user
    @comentario.save
    redirect_to carrete_path(@carrete)
  end

  def destroy
    @carrete = Carrete.find(params[:carrete_id])
    @comentario = @carrete.comentarios.find(params[:id])
    @comentario.destroy
    redirect_to carrete_path(@carrete)
  end

  private

  def comentario_params
    params.require(:comentario).permit(:user, :body)
  end
end
