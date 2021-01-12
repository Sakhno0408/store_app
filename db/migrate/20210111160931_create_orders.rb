class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :adress
      t.string :credit_card
      t.references :delivery_method

      t.timestamps
    end
  end
end
