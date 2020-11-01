class Servicio < ApplicationRecord
  belongs_to :user
  has_many :servicecomments
end
