# migration for departments
class Departments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :company_id, index: true, foreign_key: true, null: false
      t.string :name, null: false, limit: 30
      t.string :description, limit: 250

      t.timestamps null: false
    end
  end
end
