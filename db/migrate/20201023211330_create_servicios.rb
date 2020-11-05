# frozen_string_literal: true

class CreateServicios < ActiveRecord::Migration[5.2]
  def change
    create_table :servicios do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
