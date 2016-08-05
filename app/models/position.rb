class Position < ActiveRecord::Base

  has_and_belongs_to_many :companies,  dependent: :delete_all, foreign_key: :company_id
  validates :name, presence: true, uniqueness: true

end
