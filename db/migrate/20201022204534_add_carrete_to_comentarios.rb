class AddCarreteToComentarios < ActiveRecord::Migration[5.2]
  def change
    add_reference :comentarios, :carrete, foreign_key: true
    add_reference :comentarios, :user, foreign_key: true
  end
end
