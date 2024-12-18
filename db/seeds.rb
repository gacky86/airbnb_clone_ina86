require 'faker'
# 1. Clean the database 🗑️
puts "Cleaning database..."
# Request.destroy_all
# Review.destroy_all
House.destroy_all
User.destroy_all

# define category
CATEGORY = ["well-designed", "iconic", "beach front", "cave", "off-grid", "excellent view", "log house", "mansion", "castle", "pool"]

# 2. Create the instances 🏗️
puts "Creating 10 Users and houses..."
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.capitalize}#{last_name.capitalize}@mail.com",
    password: "123456"
  )
  user.photo.attach(
    io: File.open(Rails.root.join('app/assets/images/test_images/user/ryuya_avatar.jpeg')),
    filename: 'ryuya.jpg',
    content_type: 'image/jpeg'
  )
  user.save
  country = Faker::Address.country
  city = Faker::Address.city
  house = House.new(
    title: "A house in #{city}",
    country: country,
    city: city,
    category: CATEGORY.sample(3),
    description: "Calm house located in rural area in #{city} city",
    user: user
  )
  house.photos.attach(
    io: File.open(Rails.root.join('app/assets/images/test_images/house/olivier-chatel-fC5li9OSGME-unsplash.jpg')),
    filename: 'olivier-chatel-fC5li9OSGME-unsplash.jpg',
    content_type: 'image/jpeg'
  )
  house.save
end

# puts "Creating a Request..."
# Request.create!(start_date: Date.new(2023, 8, 15), end_date: Date.new(2023, 8, 20), status: false, user: bell, house: house)
# puts "Creating a Review..."
# Review.create!(rating: 8, comment: "super good", house: house, user: bell)

# 3. Display a message 🎉
puts "Finished!"

# flaviacollier@mail.com
#
