class Product < ApplicationRecord
  validates :name,:interest_rate,:reward_points_factor, :rewards_validity_duration, presence: true
  validates :interest_rate, :reward_points_factor, :rewards_validity_duration, numericality: { greater_than: 0 }
end
