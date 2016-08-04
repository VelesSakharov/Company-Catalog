class Company < ActiveRecord::Base

  has_many :departments, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  validates :location,:contacts, presence: true

end
