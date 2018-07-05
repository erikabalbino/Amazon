# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "supersecret"

Review.delete_all
Product.delete_all
User.delete_all

super_user = User.create(
    first_name: "Jon",
    last_name: "Snow",
    email: "js@winterfell.gov",
    password: PASSWORD,
    admin: true
)

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
  
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
      password: PASSWORD
    )
end

users = User.all

puts Cowsay.say "Created #{users.count} users", :tux

100.times do
    p = Product.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::HarryPotter.quote,
        price: rand(0 ... 9999),
        user: users.sample
    ) 

    if p.valid?
        rand(0..5).times do
            Review.create(
                body: Faker::Matz.quote,
                rating: rand(1 .. 5),
                product_id: p.id,
                user: users.sample
            )
        end
    end
end

products = Product.all
reviews = Review.all

puts Cowsay.say("Created #{products.count} products", :dragon)
puts Cowsay.say("Created #{reviews.count} reviews", :sheep)
puts "Login with #{super_user.email} and password of #{PASSWORD}"
