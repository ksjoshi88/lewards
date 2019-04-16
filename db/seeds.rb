# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

#creating the admin for the app
#

 admin = User.new(email: 'admin@lewards.com', password: '123admin', password_confirmation:  '123admin',provider: 'app', is_admin: true)
 admin.save!
 admin_profile = Profile.create(user_id: admin.id, first_name: 'Admin', city: 'Pune', country: 'India')
 puts '.'