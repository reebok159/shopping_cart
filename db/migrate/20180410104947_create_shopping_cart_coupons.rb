class CreateShoppingCartCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string "name"
      t.float "min_sum_to_activate"
      t.date "expires"
      t.string "code"
      t.float "discount", default: 0.0
      t.timestamps
    end
  end
end
