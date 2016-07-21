class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_location
      t.string :company_contacts
      t.integer :company_type

      t.timestamps null: false
    end
  end
end
