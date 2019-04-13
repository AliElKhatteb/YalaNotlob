class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :invited, :integer
    add_column :orders, :joined, :integer
    add_column :orders, :status, :string
  end
end
