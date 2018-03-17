class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_items do |t|
      t.integer :quantity
      t.belongs_to :order, foreign_key: true, index: true
      t.belongs_to :product, foreign_key: true, index: true
      t.timestamps
    end
  end
end