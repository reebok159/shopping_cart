class CreateShoppingCartBillingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone
      t.integer :user_id
      t.references :billing_a, polymorphic: true, index: { name: 'index_billing_a' }

      t.timestamps
    end
  end
end
