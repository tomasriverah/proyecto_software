# frozen_string_literal: true

class Carrete < ApplicationRecord
  belongs_to :user
  has_many :comentarios
  has_one :postulacion

  def get_id
    read_attribute(:id)
  end
end
