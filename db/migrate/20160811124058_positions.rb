# migration for positions
class Positions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name, null: false, limit: 30
      t.string :description, limit: 250
      t.index :name, unique: true

      t.timestamps null: false
    end
  end
end
