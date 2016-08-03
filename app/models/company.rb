class Company < ActiveRecord::Base
  has_many :departments, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  validates :location,:contacts, presence: true


  # after_initialize :default_values
  # private
  # def default_values
  #   self.name ||= "default value"
  #   self.location ||= "default value"
  #   self.contacts ||= "default value"
  # end

end
