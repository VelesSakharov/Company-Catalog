class User < ActiveRecord::Base
  validates :name, :birth, :contacts, :status, presence: true
end
