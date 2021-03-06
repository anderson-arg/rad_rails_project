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

ActiveRecord::Schema.define(version: 20160403150236) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "answers", force: :cascade do |t|
    t.integer  "user_list_id"
    t.integer  "item_id"
    t.text     "value"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "answers", ["deleted_at"], name: "index_answers_on_deleted_at"
  add_index "answers", ["item_id"], name: "index_answers_on_item_id"
  add_index "answers", ["user_list_id"], name: "index_answers_on_user_list_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_list_id"
    t.integer  "user_id"
    t.text     "text"
    t.boolean  "is_active"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["deleted_at"], name: "index_comments_on_deleted_at"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"
  add_index "comments", ["user_list_id"], name: "index_comments_on_user_list_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "item_types", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "item_types", ["deleted_at"], name: "index_item_types_on_deleted_at"

  create_table "items", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "item_type_id"
    t.text     "text"
    t.boolean  "is_private"
    t.integer  "order"
    t.boolean  "is_active"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "items", ["deleted_at"], name: "index_items_on_deleted_at"
  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id"
  add_index "items", ["list_id"], name: "index_items_on_list_id"

  create_table "list_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string   "photo"
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

  create_table "user_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.boolean  "favorite"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_lists", ["deleted_at"], name: "index_user_lists_on_deleted_at"
  add_index "user_lists", ["list_id"], name: "index_user_lists_on_list_id"
  add_index "user_lists", ["user_id"], name: "index_user_lists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.boolean  "is_active"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "deleted_at"
    t.string   "password_digest", default: "", null: false
    t.string   "photo"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at"

end
