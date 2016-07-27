class Company < ActiveRecord::Base

  validates :name, presence: true
  validates :location, presence: true
  validates :contacts, presence: true


end
