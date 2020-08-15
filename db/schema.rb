ActiveRecord::Schema.define(version: 2020_08_07_012652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.string "address"
    t.string "phone"
    t.integer "need_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "companies_type"
    t.bigint "companies_id"
    t.index ["companies_type", "companies_id"], name: "index_farms_on_companies_type_and_companies_id"
  end

  create_table "food_banks", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.string "address"
    t.string "phone"
    t.integer "need_level"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "companies_type"
    t.bigint "companies_id"
    t.index ["companies_type", "companies_id"], name: "index_food_banks_on_companies_type_and_companies_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.string "unit_type"
    t.datetime "expiration"
    t.bigint "farm_id", null: false
    t.index ["farm_id"], name: "index_foods_on_farm_id"
  end

  create_table "logistics_companies", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.string "address"
    t.string "phone"
    t.integer "max_load"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "companies_type"
    t.bigint "companies_id"
    t.index ["companies_type", "companies_id"], name: "index_logistics_companies_on_companies_type_and_companies_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "employable_type"
    t.bigint "employable_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employable_type", "employable_id"], name: "index_users_on_employable_type_and_employable_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "foods", "farms"
end
