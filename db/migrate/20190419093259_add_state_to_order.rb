class AddStateToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :usernotify, :string
  end
end
