class Company < ActiveRecord::Base

  has_and_belongs_to_many :positions, dependent: :delete_all
  has_many :departments, dependent: :delete_all
  has_many :users, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
  validates :location,:contacts, presence: true

end
