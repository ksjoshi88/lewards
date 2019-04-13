json.extract! product, :id, :name, :interest_rate, :reward_points_factor, :rewards_validity_duration, :created_at, :updated_at
json.url product_url(product, format: :json)
