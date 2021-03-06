# frozen_string_literal: true

class CreateServicecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :servicecomments do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.references :servicio, foreign_key: true

      t.timestamps
    end
  end
end
