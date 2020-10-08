class ComentariosController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.create(comentario_params)
		@comentario.save
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.find(params[:id])
		@comentario.destroy
		redirect_to post_path(@post)
	end

  private

  def comentario_params
  	params.require(:comentario).permit(:author, :body)
  end
end
