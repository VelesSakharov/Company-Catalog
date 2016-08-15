# model describing position
class Position < ActiveRecord::Base
  has_and_belongs_to_many :company, dependent: :delete_all
  has_many :users

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :description, length: { maximum: 250 }
end
