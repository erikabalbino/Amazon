# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

1000.times do
    Product.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::HarryPotter.quote,
        price: rand(0 ... 9999)
    ) 
end

products = Product.all

puts Cowsay.say("Created #{products.count} products", :dragon)
