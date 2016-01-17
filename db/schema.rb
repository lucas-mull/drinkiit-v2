# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151227144926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ingredient_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "multiple"
  end

  create_table "ingredient_types_meals", id: false, force: :cascade do |t|
    t.integer "meal_id"
    t.integer "ingredient_type_id"
  end

  add_index "ingredient_types_meals", ["meal_id", "ingredient_type_id"], name: "index_meals_ingredient_types_on_meal_id_and_ingredient_type_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "ingredient_type_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "ingredients_orders", id: false, force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "order_id"
  end

  add_index "ingredients_orders", ["ingredient_id", "order_id"], name: "index_ingredients_orders_on_ingredient_id_and_order_id", using: :btree

  create_table "meals", force: :cascade do |t|
    t.float    "price",       null: false
    t.boolean  "standalone",  null: false
    t.string   "description"
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "ordered_at"
    t.boolean  "served"
    t.float    "total"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "meal_id"
    t.integer  "quantity"
    t.string   "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid",        null: false
    t.string   "lastname"
    t.string   "name"
    t.float    "solde"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "admin"
    t.string   "email"
    t.integer  "promo"
  end

end
