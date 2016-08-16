# frozen_string_literal: true
class Department < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 250 }
  validates :company_id, presence: true
end
