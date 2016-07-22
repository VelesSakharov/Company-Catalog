class Company < ActiveRecord::Base


  def create
    create_table :companies do |t|
      t.string :company_name
      t.string :company_location
      t.string :company_contacts
      t.integer :company_type

      t.timestamps
    end
  end

end
