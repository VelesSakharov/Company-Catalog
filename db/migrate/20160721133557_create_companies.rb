# migration for companies
class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false, limit: 30
      t.string :location, null: false, limit: 60
      t.string :contacts, null:  false, limit: 60
      t.string :ownership, limit: 60

      t.index :name, unique: true
      t.timestamps null: false
    end
  end
end
