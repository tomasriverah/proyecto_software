# frozen_string_literal: true

class CreateUserDescripcions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_descripcions do |t|
      t.text :descripcion
      t.timestamps
    end
  end
end
