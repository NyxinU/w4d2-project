# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cat.destroy_all
# 20.times do
#   Cat.create(name: Faker::Name.first_name, birth_date: Faker::Date.between(20.years.ago, Date.today), sex: ['M','F'].sample, color: ['red','orange','yellow','green','blue','purple'].sample, description: "hi")
# end

10.times do
  CatRentalRequest.create(cat_id: rand(67..86), start_date: Faker::Date.backward(23), end_date: Faker::Date.forward(99))
end
