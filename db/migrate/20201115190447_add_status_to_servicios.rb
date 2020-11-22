# frozen_string_literal: true

class AddStatusToServicios < ActiveRecord::Migration[5.2]
  def change
    add_column :servicios, :status, :string
  end
end
