class AddCodigoToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :codigo, :string
  end
end
