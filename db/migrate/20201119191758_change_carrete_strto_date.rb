# frozen_string_literal: true

class ChangeCarreteStrtoDate < ActiveRecord::Migration[5.2]
  def change
    change_column :carretes, :fecha, :date, using: 'fecha::date'
  end
end
