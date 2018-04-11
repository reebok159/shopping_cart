class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_items do |t|
      t.integer :quantity
      t.belongs_to :order, foreign_key: { to_table: :shopping_cart_orders }, index: true
      t.integer :product_id, foreign_key: true
      t.timestamps
    end
  end
end
