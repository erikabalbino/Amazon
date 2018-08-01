# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "supersecret"

Favourite.delete_all
Tagging.delete_all
Tag.delete_all
Like.delete_all
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

20.times do
    Tag.create(
      name: Faker::Book.genre
      )
end
  
tags = Tag.all

puts Cowsay.say "Created #{tags.count} tags", :tux

100.times do
    p = Product.create(
        title: Faker::Hacker.say_something_smart,
        description: Faker::HarryPotter.quote,
        price: rand(0 ... 9999),
        user: users.sample,
        tags: tags.shuffle.slice(0, rand(1..4))
    ) 

    if p.valid?
        rand(0..5).times do
            r = Review.create(
                body: Faker::Matz.quote,
                rating: rand(1 .. 5),
                product_id: p.id,
                user: users.sample
            )
            if r.valid?
                rand(0..5).times.each do
                  Like.create(
                    user: users.sample,
                    review: r
                  )
                end
            end
        end
        rand(0..5).times do 
            Favourite.create(
                user: users.sample,
                product: p
            )
        end
    end
end

products = Product.all
reviews = Review.all
likes = Like.all
favourites = Favourite.all

puts Cowsay.say("Created #{products.count} products", :dragon)
puts Cowsay.say("Created #{reviews.count} reviews", :sheep)
puts Cowsay.say("Created #{likes.count} likes", :ghostbusters)
puts Cowsay.say("Created #{favourites.count} favourites", :tux)

puts "Login with #{super_user.email} and password of #{PASSWORD}"
