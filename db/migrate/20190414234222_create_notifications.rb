class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :from
      t.string :to
      t.string :type
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
