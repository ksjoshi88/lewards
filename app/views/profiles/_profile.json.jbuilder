json.extract! profile, :id, :first_name, :last_name, :city, :country, :reward_points, :rewards_expiry_date, :created_at, :updated_at
json.url profile_url(profile, format: :json)
