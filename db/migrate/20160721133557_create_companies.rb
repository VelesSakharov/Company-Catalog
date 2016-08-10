class CreateCompanies < ActiveRecord::Migration

  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :contacts
      t.string :ownership

      t.timestamps null: false
    end

    create_table :departments do |t|
      t.integer :company_id, index: true, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps null: false
    end

    create_table :positions do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :companies_positions, id: false do |t|
      t.belongs_to :company, index: true
      t.belongs_to :position, index: true
    end

    create_table :users do |t|
      t.integer :company_id, index: true, foreign_key: true
      t.integer :position_id, foreign_key: true
      t.string :name
      t.date :birth
      t.string :contacts
      t.string :education
      t.string :lastwork
      t.integer :status

      t.timestamps null: false
    end
  end
end
