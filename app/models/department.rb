class Department < ActiveRecord::Base
  validates :name, :description, presence: true
end
