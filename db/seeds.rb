# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'test1@test.ee', password: 'testpassword1', password_confirmation: 'testpassword1')
user2 = User.create(email: 'test2@test.ee', password: 'testpassword2', password_confirmation: 'testpassword2')

10.times do |i|
  dashboard = Dashboard.new(title: "Random Title #{i}", content: "Some random content #{i}")
  user1.dashboards << dashboard
end

5.times do |i|
  dashboard = Dashboard.new(title: "Random Title #{i}", content: "Some random content #{i}")
  user2.dashboards << dashboard
end