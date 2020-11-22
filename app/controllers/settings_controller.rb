# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :authenticate_user!, only: %i[:display]
  def display
  end
end
