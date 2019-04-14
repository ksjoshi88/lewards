class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer  :user_id
      t.integer  :product_id
      t.integer  :amount, null: false
      t.integer  :reward_points
      t.timestamps
    end
    add_foreign_key :purchases, :users
    add_foreign_key :purchases, :products
  end
end
