# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.delete_all
Product.delete_all

100.times do
    p = Product.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::HarryPotter.quote,
        price: rand(0 ... 9999)
    ) 

    if p.valid?
        rand(0..5).times do
            Review.create(
                body: Faker::Matz.quote,
                rating: rand(1 .. 5),
                product: p
            )
        end
    end
end

products = Product.all
reviews = Review.all

puts Cowsay.say("Created #{products.count} products", :dragon)
puts Cowsay.say("Created #{reviews.count} reviews", :sheep)
