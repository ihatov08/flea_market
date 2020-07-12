# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_12_072220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["value"], name: "index_conditions_on_value", unique: true
  end

  create_table "delivery_charges", force: :cascade do |t|
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["value"], name: "index_delivery_charges_on_value", unique: true
  end

  create_table "delivery_days", force: :cascade do |t|
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["value"], name: "index_delivery_days_on_value", unique: true
  end

  create_table "delivery_ways", force: :cascade do |t|
    t.bigint "delivery_charge_id", null: false
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_charge_id", "value"], name: "index_delivery_ways_on_delivery_charge_id_and_value", unique: true
    t.index ["delivery_charge_id"], name: "index_delivery_ways_on_delivery_charge_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.bigint "category_id", null: false
    t.string "brand_name"
    t.bigint "condition_id", null: false
    t.bigint "delivery_charge_id", null: false
    t.bigint "prefecture_id", null: false
    t.bigint "delivery_way_id", null: false
    t.bigint "delivery_day_id", null: false
    t.string "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "images"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["condition_id"], name: "index_items_on_condition_id"
    t.index ["delivery_charge_id"], name: "index_items_on_delivery_charge_id"
    t.index ["delivery_day_id"], name: "index_items_on_delivery_day_id"
    t.index ["delivery_way_id"], name: "index_items_on_delivery_way_id"
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
    t.index ["name_en"], name: "index_prefectures_on_name_en", unique: true
  end

  create_table "sizes", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id", "value"], name: "index_sizes_on_category_id_and_value", unique: true
    t.index ["category_id"], name: "index_sizes_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "given_name", null: false
    t.string "family_name", null: false
    t.string "given_name_kana", null: false
    t.string "family_name_kana", null: false
    t.integer "birth_year", null: false
    t.integer "birth_month", null: false
    t.integer "birth_day", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "delivery_ways", "delivery_charges"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "conditions"
  add_foreign_key "items", "delivery_charges"
  add_foreign_key "items", "delivery_days"
  add_foreign_key "items", "delivery_ways"
  add_foreign_key "items", "prefectures"
  add_foreign_key "items", "users"
  add_foreign_key "sizes", "categories"
end
