class CarretesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  def new
  	@carrete = Carrete.new
  end

  def create
  	@carrete = Carrete.new(carrete_params)
    @carrete.user = current_user
    
    if @carrete.save
      @postulacion = Postulacion.new()
      @postulacion.update_carrete_id(@carrete.id)
      @postulacion.save
      redirect_to carretes_index_path, notice: 'Carrete creado con exito'
    else
      render :new
    end
  end

  def index
  	@carrete = Carrete.all
  end

  def show
    @carrete = Carrete.find(params[:id])
    id_carrete = @carrete.id.dup
    @postulacion  = Postulacion.find_by(carrete_id: id_carrete )
    @monto = 0
    @postulacion.postulaciones.each do |key, value|
        @monto += value.to_i
    end
    
  end

  def edit
  	@carrete = Carrete.find(params[:id])
  end

  def update
  	@carrete = Carrete.find(params[:id])

    if @carrete.update_attributes(carrete_params)
      redirect_to carretes_index_path, notice: 'Carrete editado con exito'
    else
      render 'edit'
    end
  end

  def destroy
  	@carrete = Carrete.find(params[:id])
    @carrete.destroy
    redirect_to carretes_index_path, notice: 'Carrete borrado con exito'
  end

  def carrete_params

  	params.require(:carrete).permit(:title, :body, :user, :max_price, :min_price)
  end
end
