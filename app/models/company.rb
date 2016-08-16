# frozen_string_literal: true
class Company < ActiveRecord::Base
  has_and_belongs_to_many :positions, dependent: :delete_all
  has_many :departments, dependent: :delete_all
  has_many :users, dependent: :delete_all

  validates :name, uniqueness: true, length: { maximum: 30 }
  validates :location, :contacts, length: { maximum: 60 }
  validates :ownership, length: { maximum: 60 }
  validates :name, :location, presence: true
end
