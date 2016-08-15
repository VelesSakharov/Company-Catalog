ActiveRecord::Schema.define(version: 20160812072447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'companies', force: :cascade do |t|
    t.string   'name',       limit: 30, null: false
    t.string   'location',   limit: 60, null: false
    t.string   'contacts',   limit: 60, null: false
    t.string   'ownership',  limit: 60
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  add_index 'companies', ['name'], name: 'index_companies_on_name', unique: true, using: :btree

  create_table 'companies_positions', id: false, force: :cascade do |t|
    t.integer 'company_id',  null: false
    t.integer 'position_id', null: false
  end

  add_index 'companies_positions', ['company_id'], name: 'index_companies_positions_on_company_id', using: :btree
  add_index 'companies_positions', ['position_id'], name: 'index_companies_positions_on_position_id', using: :btree

  create_table 'dbs', force: :cascade do |t|
    t.string   'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'departments', force: :cascade do |t|
    t.integer  'company_id',              null: false
    t.string   'name',        limit: 30,  null: false
    t.string   'description', limit: 250
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
  end

  add_index 'departments', ['company_id'], name: 'index_departments_on_company_id', using: :btree

  create_table 'positions', force: :cascade do |t|
    t.string   'name',        limit: 30,  null: false
    t.string   'description', limit: 250
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
  end

  add_index 'positions', ['name'], name: 'index_positions_on_name', unique: true, using: :btree

  create_table 'users', force: :cascade do |t|
    t.integer  'company_id',              null: false
    t.integer  'position_id',             null: false
    t.string   'name',        limit: 30,  null: false
    t.date     'birth',                   null: false
    t.string   'contacts',    limit: 60,  null: false
    t.string   'education',   limit: 120
    t.string   'lastwork',    limit: 30
    t.integer  'status',                  null: false
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
  end

  add_index 'users', ['company_id'], name: 'index_users_on_company_id', using: :btree

end
