class PostController < ApplicationController
  def index
  	@post = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to post_index_path, notice: "Publicacion creada con exito"
  	else
  		render :new
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to post_index_path, notice: "Publicacion borrada con exito"
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])

  	if @post.update_attributes(post_params)
  		redirect_to post_index_path, notice: "Publicacion editada con exito"
  	else
  		render 'edit'
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  private

  def post_params
  	params.require(:post).permit(:author, :title, :tipo, :comment)
  end
end

