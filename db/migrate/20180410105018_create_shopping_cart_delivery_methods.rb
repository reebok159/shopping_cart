class CreateShoppingCartDeliveryMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_delivery_methods do |t|
      t.string "name"
      t.string "delay"
      t.integer "cost"
      t.timestamps
    end
  end
end
