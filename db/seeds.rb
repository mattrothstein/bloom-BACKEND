# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times {|x| Entity.create!(name: "Store#{x}", details: "I am a store.") }

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')