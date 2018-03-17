# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180317212909) do

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_billing_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.integer "user_id"
    t.string "billing_a_type"
    t.integer "billing_a_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_a_type", "billing_a_id"], name: "index_billing_a"
  end

  create_table "shopping_cart_coupons", force: :cascade do |t|
    t.string "name"
    t.float "min_sum_to_activate"
    t.date "expires"
    t.string "code"
    t.float "discount", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.string "expires"
    t.string "cvv"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_cart_credit_cards_on_order_id"
  end

  create_table "shopping_cart_delivery_methods", force: :cascade do |t|
    t.string "name"
    t.string "delay"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_cart_order_items_on_order_id"
    t.index ["product_id"], name: "index_shopping_cart_order_items_on_product_id"
  end

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "checkout_state"
    t.decimal "total_price", precision: 11, scale: 2, default: "0.0"
    t.datetime "completed_at"
    t.integer "user_id"
    t.integer "delivery_method_id"
    t.integer "coupon_id"
    t.boolean "use_billing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_shopping_cart_orders_on_coupon_id"
    t.index ["delivery_method_id"], name: "index_shopping_cart_orders_on_delivery_method_id"
    t.index ["user_id"], name: "index_shopping_cart_orders_on_user_id"
  end

  create_table "shopping_cart_shipping_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.integer "user_id"
    t.string "shipping_a_type"
    t.integer "shipping_a_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_a_type", "shipping_a_id"], name: "index_shipping_a"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
