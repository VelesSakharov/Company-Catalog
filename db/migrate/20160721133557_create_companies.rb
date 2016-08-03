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
      t.integer :company, index: true, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps null: false
    end

  end
end
