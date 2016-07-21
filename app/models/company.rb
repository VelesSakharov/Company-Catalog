class Company < ActiveRecord::Base
  #attr_accessible :name, :location, :contacts, :type

  def create
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :contacts
      t.integer :type

      t.timestamps
    end
  end
end
