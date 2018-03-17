class CreateShoppingCartCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.string "number"
      t.string "name"
      t.string "expires"
      t.string "cvv"
      t.belongs_to :order, foreign_key: true, index: true
      t.timestamps
    end
  end
end
