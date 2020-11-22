# frozen_string_literal: true

class Comuna < ApplicationRecord
  has_many :users
  has_many :cobertura_servicio, dependent: :destroy
  has_many :servicios, through: :cobertura_servicio
end
