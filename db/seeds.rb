10.times do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    comments: Faker::Company.bs
  )
end

puts "10 Contacts created"
