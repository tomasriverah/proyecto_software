class AddComunaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :comunas  
  end
end
