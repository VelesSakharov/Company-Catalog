class Company < ActiveRecord::Base

  validates :name, presence: true
  validates :location, presence: true
  validates :contacts, presence: true

  # after_initialize :default_values
  #
  # private
  # def default_values
  #   self.name ||= "default value"
  #   self.location ||= "default value"
  #   self.contacts ||= "default value"
  # end

end
