
ActiveRecord::Schema.define(version: 2023_03_06_231225) do

  enable_extension "plpgsql"

  create_table "inks", force: :cascade do |t|
    t.string "name"
    t.string "color_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stage"
    t.string "ink_name"
  end

  create_table "orders", force: :cascade do |t|
    t.string "ink_name"
    t.integer "order_quantity"
    t.date "order_date"
    t.bigint "user_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_orders_on_supplier_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ink_name"
    t.string "color_type"
    t.integer "quantity"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stage"
    t.string "location_name"
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "orders", "suppliers"
  add_foreign_key "orders", "users"
  add_foreign_key "stocks", "users"
end
