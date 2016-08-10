class User < ActiveRecord::Base

  belongs_to :company

  validates :name, :birth, :contacts, :status, :company_id, :position_id, presence: true

  class << columns_hash['birth']
    def type
      :date
    end
  end

end
