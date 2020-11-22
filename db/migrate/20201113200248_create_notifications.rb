# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :n_text
      t.boolean :is_checked

      t.timestamps
    end
  end
end
