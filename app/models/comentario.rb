class Comentario < ApplicationRecord
  belongs_to :post
  # attr_accessor :author, :body
end
