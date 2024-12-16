# db/seeds.rb
# 1. Clean the database 🗑️
puts "Cleaning database..."
User.destroy_all
House.destroy_all
Request.destroy_all
Review.destroy_all

# 2. Create the instances 🏗️
puts "Creating 2 Users..."
ryuya = User.create!(first_name: "Ryuya", last_name: "Inagaki", email: "ryuya@gmail.com", password: "123456")
bell = User.create!(first_name: "Bell", last_name: "Chranell", email: "bell@gmail.com", password: "123456")
puts "Creating a House..."
house = House.create!(title: "Ebina house", description: "Calm house located in rural area in Ebina city", user: ryuya)
puts "Creating a Request..."
Request.create!(start_date: Date.new(2023, 8, 15), end_date: Date.new(2023, 8, 20), status: false, user: bell, house: house)
puts "Creating a Review..."
Review.create!(rating: 8, comment: "super good", house: house, user: bell)

# 3. Display a message 🎉
puts "Finished!"
