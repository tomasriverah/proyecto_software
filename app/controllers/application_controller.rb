# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  def show
    @user = User.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :comunas_id, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :comunas_id, :email, :password, :current_password) }
  end
end
