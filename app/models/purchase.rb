class Purchase < ApplicationRecord

  belongs_to :product
  belongs_to :user

  validates :user_id,:product_id,:amount, :loan_period, presence: true
  validates :loan_period, numericality: { greater_than: 0 }
end
