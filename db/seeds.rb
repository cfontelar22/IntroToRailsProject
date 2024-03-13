# db/seeds.rb

require 'faker'
require 'httparty'
require 'csv'

# Clear existing data
User.delete_all
Book.delete_all
LibraryBranch.delete_all
Weather.delete_all

# Faker for Users
100.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# OpenWeatherMap API for Weather
cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego', 'Dallas', 'San Jose']
cities.each do |city|
  response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPENWEATHERMAP_API_KEY']}&units=metric")
  
  if response.success?
    data = response.parsed_response
    Weather.create!(
      location: "#{data['name']}, #{data['sys']['country']}",
      temperature: data['main']['temp'],
      humidity: data['main']['humidity'],
      wind_speed: data['wind']['speed'].to_f # Ensuring wind_speed is a float
    )
  else
    puts "Error fetching weather data for #{city}: #{response.body}"
  end
end

# CSV for Library Data
CSV.foreach(Rails.root.join('lib/seeds/library_data.csv'), headers: true) do |row|
  library_branch = LibraryBranch.find_or_create_by!(
    name: row['Library Name'], 
    location: row['Library Location']
  )
  
  Book.create!(
    title: row['Title'],
    author: row['Author'],
    genre: row['Genre'],
    publication_year: row['Publication Year'],
    library_branch: library_branch
  )
end

puts "Database seeded successfully!"
puts "Users count: #{User.count}"
puts "Weather records count: #{Weather.count}"
puts "Books count: #{Book.count}"
puts "Library branches count: #{LibraryBranch.count}"
