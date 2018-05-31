5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    confirmed_at: Time.now
  )
end

users = User.all

50.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.words(4),
  )
end

items = Item.all

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Item.count} items created."
