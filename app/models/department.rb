class Department < ActiveRecord::Base

  belongs_to :company

  validates :name, :company_id, presence: true

end
