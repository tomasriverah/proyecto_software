# frozen_string_literal: true

class CarreteServicio < ApplicationRecord
  belongs_to :carrete
  belongs_to :servicio
end
