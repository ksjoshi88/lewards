class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
      t.string  :name, null: false
      t.float   :interest_rate, null: false
      t.float   :reward_points_factor, null: false
      t.integer :rewards_validity_duration, null: false , default: 12
      t.timestamps
    end

    #this is to create seed data for Products
    Product.create(name: 'Car Loan', interest_rate: 12.0, reward_points_factor: 5.0, rewards_validity_duration: 12 )
    Product.create(name: 'Personal Loan', interest_rate: 15.0, reward_points_factor: 5.0, rewards_validity_duration: 12 )
    Product.create(name: 'Home Loan', interest_rate: 13.0, reward_points_factor: 5.0, rewards_validity_duration: 12 )
    Product.create(name: 'Education Loan', interest_rate: 11.0, reward_points_factor: 5.0, rewards_validity_duration: 12 )
    Product.create(name: 'Car Loan', interest_rate: 12.0, reward_points_factor: 5.0, rewards_validity_duration: 12 )

  end

  def down

    drop_table :products

  end

end
