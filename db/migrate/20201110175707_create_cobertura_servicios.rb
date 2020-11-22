# frozen_string_literal: true

class CreateCoberturaServicios < ActiveRecord::Migration[5.2]
  def change
    create_table :cobertura_servicios do |t|
      t.references :comuna, foreign_key: true
      t.references :servicio, foreign_key: true

      t.timestamps
    end
  end
end
