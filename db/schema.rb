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

ActiveRecord::Schema.define(version: 2020_05_28_103858) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "costomer_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "costomer_id"
    t.integer "product_id"
    t.integer "cart_id"
    t.integer "number", default: 1
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "costomer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "costomers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "family_name"
    t.string "middle_name"
    t.string "family_name_kana"
    t.string "middle_name_kana"
    t.string "address"
    t.string "zipcode"
    t.string "phone_number"
    t.boolean "is_withdraw", default: false
    t.index ["email"], name: "index_costomers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_costomers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordered_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "number"
    t.integer "production_status", default: 0
    t.integer "price"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "costomer_id", null: false
    t.string "delivery_address", null: false
    t.integer "pay_method", null: false
    t.integer "order_status", default: 0
    t.string "delivery_zipcode", null: false
    t.string "address_name", null: false
    t.integer "postage", null: false
    t.integer "billing_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "deliver", default: 0, null: false
    t.integer "ordered_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "explain", null: false
    t.integer "notax_price", null: false
    t.string "image_id", null: false
    t.integer "genre_id", null: false
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer "costomer_id"
    t.string "zipcode"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
