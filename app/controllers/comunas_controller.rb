# frozen_string_literal: true

class ComunasController < ApplicationController
  before_action :authenticate_user!, only: %i[:index :new :edit]
  def create
    @comuna = Comuna.new(comuna_params)

    if @comuna.save
      redirect_to comunas_path, notice: 'Comuna agregada con éxito'
    else
      render :new
    end
  end

  def index
    @comuna = Comuna.order(:nombre)
  end

  def new
    @comuna = Comuna.new
  end

  def edit
    @comuna = Comuna.find(params[:id])
  end

  def destroy
    @comuna = Comuna.find(params[:id])
    @comuna.destroy
    redirect_to comunas_index_path, notice: 'Comuna borrada con exito'
  end

  def update
    @comuna = Comuna.find(params[:id])

    if @comuna.update(comuna_params)
      redirect_to @comuna
    else
      render 'edit'
    end
  end

  private

  def comuna_params
    params.require(:comuna).permit(:nombre)
  end
end
