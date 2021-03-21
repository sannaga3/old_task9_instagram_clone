require 'faker'

50.times do |n|
  name = Faker::Creature::Cat.name
  email = Faker::Internet.email
  image = nil
  password = "password"
  User.create!(name: name,
               email: email,
               image: image,
               password: password,
               )
end





