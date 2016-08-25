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

ActiveRecord::Schema.define(version: 20160818124520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 30, null: false
    t.string   "location",   limit: 60, null: false
    t.string   "contacts",   limit: 60, null: false
    t.string   "ownership",  limit: 60
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "companies_positions", id: false, force: :cascade do |t|
    t.integer "company_id",  null: false
    t.integer "position_id", null: false
  end

  add_index "companies_positions", ["company_id"], name: "index_companies_positions_on_company_id", using: :btree
  add_index "companies_positions", ["position_id"], name: "index_companies_positions_on_position_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.integer  "company_id",              null: false
    t.string   "name",        limit: 30,  null: false
    t.string   "description", limit: 250
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "departments", ["company_id"], name: "index_departments_on_company_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer  "company_id",              null: false
    t.integer  "position_id",             null: false
    t.string   "name",        limit: 30,  null: false
    t.date     "birth",                   null: false
    t.string   "contacts",    limit: 60,  null: false
    t.string   "education",   limit: 120
    t.string   "lastwork",    limit: 30
    t.string   "status",                  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "name",        limit: 30,  null: false
    t.string   "description", limit: 250
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "positions", ["name"], name: "index_positions_on_name", unique: true, using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                          null: false
    t.string   "encrypted_password", limit: 128,                 null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                 null: false
    t.boolean  "admin",                          default: false, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
