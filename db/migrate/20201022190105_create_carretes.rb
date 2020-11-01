class CreateCarretes < ActiveRecord::Migration[5.2]
  def change
    create_table :carretes do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.integer :max_price
      t.integer :min_price

      t.timestamps
    end
  end
end
