# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!, only: %i[new_admin]
  def new_admin
    @users = User.where.not(role_id: '2')
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_role(2)
    redirect_to root_url, notice: 'Usuario es Administrador.'
  end
end
