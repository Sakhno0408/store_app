class CreateDeliveryMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_methods do |t|
      t.string :name_delivery_method
      t.timestamps
    end
  end
end
