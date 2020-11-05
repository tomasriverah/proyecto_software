# frozen_string_literal: true

class Servicecomment < ApplicationRecord
  belongs_to :user
  belongs_to :servicio
end
