class ProfileController < ApplicationController
  def profile
    @users = User.all
  end
  
  def make_service
    @user = current_user
    @user.update_role(2)
    redirect_to root_url, notice: "Usuario es proveedor de servicio."
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_role(3)
    redirect_to root_url, notice: "Usuario es Administrador."
  end

  def destroy
  ### https://stackoverflow.com/questions/21192949/deleting-users-in-devise-generated-model referencia
    @user = User.find(params[:id]).destroy
    @user.destroy
    if @user.destroy
      redirect_to root_url, notice: "Usuario eliminado."
    end
  end


  def redir
    redirect_to home_page_home_path
  end
end
