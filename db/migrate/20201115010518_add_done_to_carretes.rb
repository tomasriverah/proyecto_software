# frozen_string_literal: true

class AddDoneToCarretes < ActiveRecord::Migration[5.2]
  def change
    add_column :carretes, :done, :boolean
  end
end
