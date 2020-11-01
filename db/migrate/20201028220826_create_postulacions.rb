class CreatePostulacions < ActiveRecord::Migration[5.2]
  def change
    create_table :postulacions do |t|
      t.integer :carrete_id
      t.text :postulaciones

      t.timestamps
    end
  end
end
