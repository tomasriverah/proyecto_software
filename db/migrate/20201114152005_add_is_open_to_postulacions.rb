# frozen_string_literal: true

class AddIsOpenToPostulacions < ActiveRecord::Migration[5.2]
  def change
    add_column :postulacions, :is_open, :integer
  end
end
