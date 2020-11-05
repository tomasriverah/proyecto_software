# frozen_string_literal: true

class Servicio < ApplicationRecord
  belongs_to :user
  has_many :servicecomments
end
