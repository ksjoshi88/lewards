class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.integer :reward_points, default: 0
      t.datetime :rewards_expiry_date
      t.integer  :user_id
      t.timestamps
    end

    add_foreign_key :profiles, :users
  end
end
