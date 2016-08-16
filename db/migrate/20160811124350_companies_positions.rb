class CompaniesPositions < ActiveRecord::Migration
  def change
    create_table :companies_positions, id: false do |t|
      t.belongs_to :company, index: true, null: false
      t.belongs_to :position, index: true, null: false
    end
  end
end
