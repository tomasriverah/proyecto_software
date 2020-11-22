# frozen_string_literal: true

class Servicio < ApplicationRecord
  belongs_to :user
  has_many :servicecomments, dependent: :destroy
  has_many :cobertura_servicio, dependent: :destroy
  has_many :carrete_servicio, dependent: :destroy
  has_many :comunas, through: :cobertura_servicio
  has_many :carretes, through: :carrete_servicio
end
