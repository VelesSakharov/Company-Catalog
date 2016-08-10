class CreateCompanies < ActiveRecord::Migration

  def change
    create_table :companies do |t|
      t.string :name, null: false, unique: true, limit: 30
      t.string :location, null: false, limit: 60
      t.string :contacts, null:  false, limit: 60
      t.string :ownership, limit: 60

      t.timestamps null: false
    end

    create_table :departments do |t|
      t.integer :company_id, index: true, foreign_key: true, null: false
      t.string :name, null: false, limit: 30
      t.string :description, limit: 250

      t.timestamps null: false
    end

    create_table :positions do |t|
      t.string :name, null: false, unique: true, limit: 30
      t.string :description, limit: 250
      t.timestamps
    end

    create_table :companies_positions, id: false do |t|
      t.belongs_to :company, index: true, null: false
      t.belongs_to :position, index: true, null: false
    end

    create_table :users do |t|
      t.integer :company_id, index: true, foreign_key: true, null: false
      t.integer :position_id, foreign_key: true, null: false
      t.string :name, null: false, limit: 30
      t.date :birth, null: false
      t.string :contacts, null: false, limit: 60
      t.string :education, limit: 120
      t.string :lastwork, limit: 30
      t.integer :status, null: false

      t.timestamps null: false
    end
  end
end
