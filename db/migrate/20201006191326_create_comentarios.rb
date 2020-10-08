class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :author
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end

    # add_index :comentarios, :post_id
  end
end
