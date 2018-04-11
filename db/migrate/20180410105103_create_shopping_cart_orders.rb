class CreateShoppingCartOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_orders do |t|
      t.integer :status, default: 0
      t.string :checkout_state
      t.decimal :total_price, precision: 11, scale: 2, default: 0
      t.datetime :completed_at
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :delivery_method, foreign_key: { to_table: :shopping_cart_delivery_methods }, index: true
      t.belongs_to :coupon, foreign_key: { to_table: :shopping_cart_coupons }, index: true
      t.boolean :use_billing
      t.timestamps
    end
  end
end
