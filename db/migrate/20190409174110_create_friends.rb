class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :friend_email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
