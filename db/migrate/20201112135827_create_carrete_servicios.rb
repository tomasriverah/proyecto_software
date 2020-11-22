# frozen_string_literal: true

class CreateCarreteServicios < ActiveRecord::Migration[5.2]
  def change
    create_table :carrete_servicios do |t|
      t.references :carrete, foreign_key: true
      t.references :servicio, foreign_key: true

      t.timestamps
    end
  end
end
