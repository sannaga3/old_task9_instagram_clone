require 'faker'

50.times do |n|
  name = Faker::JapaneseMedia::Doraemon.location #=> "Tokyo"
  email = Faker::Internet.email
  image = nil
  password = "password"
  User.create!(name: name,
               email: email,
               image: image,
               password: password,
               )
end

50.times do |n|
content = Faker::Games::Pokemon.move
post_image = nil
user_id = SecureRandom.random_number(50)
Picture.create!(content: content,
               post_image: post_image,
               user_id: user_id,
               )
end



