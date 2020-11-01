class Carrete < ApplicationRecord
  belongs_to :user
  has_many :comentarios
  has_one :postulacion

  def get_id
    return read_attribute(:id)
  end  
end
