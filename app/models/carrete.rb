# frozen_string_literal: true

class Carrete < ApplicationRecord
  belongs_to :user
  has_many :comentarios, dependent: :destroy
  has_one :postulacion
  has_many :carrete_servicio, dependent: :destroy
  has_many :servicios, through: :carrete_servicio

  def get_id
    read_attribute(:id)
  end
end
