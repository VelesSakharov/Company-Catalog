class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :company_id, index: true, foreign_key: true, null: false
      t.integer :position_id, foreign_key: true, null: false
      t.string :name, null: false, limit: 30
      t.date :birth, null: false
      t.string :contacts, null: false, limit: 60
      t.string :education, limit: 120
      t.string :lastwork, limit: 30
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
