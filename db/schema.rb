# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_07_182958) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "block"
    t.string "lot"
    t.string "colony"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "batches", force: :cascade do |t|
    t.integer "price"
    t.string "lot"
    t.string "block"
    t.text "boundaries"
    t.string "state", default: "1"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "square_meters"
    t.bigint "contract_id"
    t.string "uuid"
    t.index ["contract_id"], name: "index_batches_on_contract_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "total_amount"
    t.integer "total_payments"
    t.text "comments"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "down_payment"
    t.date "next_payment"
    t.date "first_payment"
    t.integer "monthly_payment"
    t.boolean "map", default: false
    t.date "map_date"
    t.date "signing_date"
    t.index ["client_id"], name: "index_contracts_on_client_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.string "file_number"
    t.string "kind"
    t.float "amount"
    t.text "comments"
    t.bigint "contract_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "realization_date"
    t.index ["contract_id"], name: "index_payments_on_contract_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_phones_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "batches", "contracts"
  add_foreign_key "contracts", "clients"
  add_foreign_key "payments", "contracts"
  add_foreign_key "phones", "clients"
end
