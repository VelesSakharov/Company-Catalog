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

ActiveRecord::Schema.define(version: 20160721133557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "contacts"
    t.string   "ownership"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_positions", id: false, force: :cascade do |t|
    t.integer "company_id"
    t.integer "position_id"
  end

  add_index "companies_positions", ["company_id"], name: "index_companies_positions_on_company_id", using: :btree
  add_index "companies_positions", ["position_id"], name: "index_companies_positions_on_position_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "departments", ["company_id"], name: "index_departments_on_company_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
