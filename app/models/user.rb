class User < ActiveRecord::Base
  belongs_to :company
  belongs_to :position

  validates :name, presence: true, length: { maximum: 30 }
  validates :contacts, presence: true, length: { maximum: 60 }
  validates :education, length: { maximum: 120 }
  validates :lastwork, length: { maximum: 30 }
  validates :birth, :status, :company_id, :position_id, presence: true
  validates :status, inclusion: %w(Trainee Working Fired)
end
