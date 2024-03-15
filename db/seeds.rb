require 'faker'
require 'httparty'
require 'csv'

# Clear existing data
Review.delete_all
Book.delete_all
LibraryBranch.delete_all
Weather.delete_all
User.delete_all

# Faker for Users
100.times do |i|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end

# OpenWeatherMap API for Weather
cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego', 'Dallas', 'San Jose']
cities.each do |city|
  response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPENWEATHERMAP_API_KEY']}&units=metric")
  next unless response.success?

  data = response.parsed_response
  Weather.create!(
    location: "#{data['name']}, #{data['sys']['country']}",
    temperature: data['main']['temp'],
    humidity: data['main']['humidity'],
    wind_speed: data['wind']['speed'].to_f
  )
end

# CSV for Library Data and Books
CSV.foreach(Rails.root.join('lib/seeds/library_data.csv'), headers: true) do |row|
  library_branch = LibraryBranch.find_or_create_by!(
    name: row['Library Name'],
    location: row['Library Location']
  )

  book = library_branch.books.find_or_create_by!(
    title: row['Title'],
    author: row['Author'],
    genre: row['Genre'],
    publication_year: row['Publication Year']
  )
  
  # Create a default review for the first user and book
  if User.any?
    book.reviews.find_or_create_by!(
      content: "Great read!",
      user: User.first
    )
  end
end

puts "Database seeded successfully!"
puts "Users count: #{User.count}"
puts "Weather records count: #{Weather.count}"
puts "Books count: #{Book.count}"
puts "Library branches count: #{LibraryBranch.count}"
puts "Reviews count: #{Review.count}"
