# frozen_string_literal: true

class AddAtributtesToCarretes < ActiveRecord::Migration[5.2]
  def change
    add_column :carretes, :direccion, :string
    add_reference :carretes, :comuna, foreign_key: true
    add_column :carretes, :capacidad_maxima, :int
    add_column :carretes, :fecha, :string
  end
end
