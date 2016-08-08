class Company < ActiveRecord::Base
  has_and_belongs_to_many :positions, dependent: :delete_all#, foreign_key: :position_id
  has_many :departments, dependent: :delete_all, foreign_key: :company_id

  validates :name, presence: true, uniqueness: true
  validates :location,:contacts, presence: true

end
