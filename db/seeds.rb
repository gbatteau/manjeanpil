10.times do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    comments: Faker::Company.bs
  )
end

puts "10 Contacts created"

customer_plan   = Plan.create(name: 'customer', price: 0)
restaurant_plan = Plan.create(name: 'restaurant', price: 0)

puts "2 Plans created"

20.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "secret123",
    password_confirmation: "secret123",
    plan: Plan.all.sample
  )
end

puts "20 sample users created"

customer = User.create!(
  email: "customer@example.com",
  password: "secret123",
  password_confirmation: "secret123",
  plan: customer_plan
)

restaurant_user = User.create!(
  email: "restaurant@example.com",
  password: "secret123",
  password_confirmation: "secret123",
  plan: restaurant_plan
)

puts "2 demo users created"


50.times do
  Place.create!(
    name: Faker::Company.name,
    restaurant_name: Faker::Company.name,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip_code: Faker::Address.zip,
    country: "USA",
    user_id: User.all.sample.id
  )
end

puts "50 places created"

50.times do
  Post.create!(
    restaurant_name: Faker::Company.name,
    description: Faker::Company.bs,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip,
    user: User.all.sample
  )
end

puts "50 posts created"

