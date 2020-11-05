# frozen_string_literal: true

class Comentario < ApplicationRecord
    belongs_to :carrete
    belongs_to :user
    # attr_accessor :author, :body
  end
  