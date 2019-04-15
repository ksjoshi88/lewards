class UpdatePurchase < ActiveRecord::Migration[5.2]
  def change
    add_column(:purchases, :loan_period, :integer, null: false, default: 1)
  end
end
