class Position < ActiveRecord::Base

  has_and_belongs_to_many :company,  dependent: :delete_all

  validates :name, presence: true, uniqueness: true

end
