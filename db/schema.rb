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

ActiveRecord::Schema.define(version: 20170220191831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_offers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "price"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_offers_on_product_id", using: :btree
    t.index ["user_id"], name: "index_product_offers_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "platform"
    t.string   "genre"
    t.integer  "release_year"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "delivery_address"
    t.string   "return_address"
    t.string   "order_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "buyer_id"
    t.integer  "product_offer_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "seller"
    t.string   "username"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "product_offers", "products"
  add_foreign_key "product_offers", "users"
end
