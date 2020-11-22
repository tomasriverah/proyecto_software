class AddUidtoDescrpicion < ActiveRecord::Migration[5.2]
  def change
    add_column :user_descripcions, :user_id, :integer
  end
end
