# frozen_string_literal: true

class CoberturaServicio < ApplicationRecord
  belongs_to :comuna
  belongs_to :servicio
end
