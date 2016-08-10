class User < ActiveRecord::Base
  validates :name, :birth, :contacts, :status, presence: true
    class << columns_hash['birth']
      def type
        :date
      end
    end
end
