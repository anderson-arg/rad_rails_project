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

ActiveRecord::Schema.define(version: 20160211201848) do

  create_table "item_types", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "item_types", ["deleted_at"], name: "index_item_types_on_deleted_at"

  create_table "list_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "list_categories", ["deleted_at"], name: "index_list_categories_on_deleted_at"

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "is_private"
    t.boolean  "is_active"
    t.integer  "user_id"
    t.integer  "list_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
  end

  add_index "lists", ["deleted_at"], name: "index_lists_on_deleted_at"
  add_index "lists", ["list_category_id"], name: "index_lists_on_list_category_id"
  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at"

end
