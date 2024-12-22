require 'faker'
# 1. Clean the database 🗑️
puts "Cleaning database..."
# Request.destroy_all
# Review.destroy_all
House.destroy_all
User.destroy_all

# define category
CATEGORY = ["house", "apartment", "barn", "B&B", "boat, ship", "log house", "camping car", "cave", "castle"]
FEATURES = ["pool", "open-air bath", "patio", "BBQ grill", "outdoor dining", "campfire",
  "billiards", "stove", "piano", "exercise equipments", "lakeside", "beachside", "skiing",
  "shower", "Wi-Fi", "tv", "full kitchen", "laundry", "free parking space", "paid parking space", "AC", "working space"]

image_paths = [
  'app/assets/images/test_images/house/house.jpg',
  'app/assets/images/test_images/house/bathroom.jpg',
  'app/assets/images/test_images/house/bed.jpg',
  'app/assets/images/test_images/house/livingroom.jpg',
  'app/assets/images/test_images/house/parking.jpg'
]


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
    zip_code: 12345,
    street: "example street",
    country: country,
    city: city,
    categories: CATEGORY.sample(3),
    guests_number: rand(10),
    beds_number: rand(10),
    bathroom_number: rand(5),
    features: FEATURES.sample(10),
    min_accom_days: rand(7),
    checkin_time: "16:00",
    checkout_time: "11:00",
    pets: true,
    smoking: false,
    party: true,
    other_rule: "nothing special",
    description: "Calm house located in rural area in #{city} city",
    accom_fee: rand(1_000_000),
    user: user
  )
  image_paths.each do |image_path|
    house.photos.attach(
      io: File.open(Rails.root.join(image_path)),
      filename: File.basename(image_path),
      content_type: 'image/jpeg'
    )
  end
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
