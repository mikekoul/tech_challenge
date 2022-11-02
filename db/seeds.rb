# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mike = Customer.create!(first_name: 'Mike', last_name: 'Koul', email: 'mike@gmail.com', address: '123 Main Street')

green_tea = Tea.create!(title: 'Green Tea', description: 'Japanese oolong green tea leaves', temperature: '175 F', brew_time: '3 minutes')

mike_green_tea_sub = Subscription.create!(title: 'Green tea subscription', price: '$9.99', status: 0, frequency: 'Once a month', tea_id: green_tea.id, customer_id: mike.id )