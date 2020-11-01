class SettingsController < ApplicationController
  before_action :authenticate_user!, only: [:display]
  def display
  end
end
