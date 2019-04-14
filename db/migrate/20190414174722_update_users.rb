class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    #update the users table for social logins
    add_column(:users, :provider, :string, limit: 50, null: false, default: 'app')
    add_column(:users, :uid, :string, limit: 500, null: false, default: '')
    remove_column(:users, :login_type)
  end
end
