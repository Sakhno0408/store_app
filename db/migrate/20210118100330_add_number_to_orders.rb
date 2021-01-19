class AddNumberToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :number_order, :integer
  end
end
