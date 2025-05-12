# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Recipe.destroy_all
recipes_array = [
{name: "Carbonara", description: "Egg pasta", image_url: "", rating: "4.2"},
{name: "Macaronni", description: "Cheese pasta", image_url: "", rating: "4.0"},
{name: "Bolognese", description: "Meat pasta", image_url: "", rating: "4.8"},
{name: "Pesto", description: "Pesto pasta", image_url: "", rating: "3.0"},
]

recipes_array.each do |recipe| 
    Recipe.create(name: recipe[:name], description: recipe[:description], image_url: recipe[:image_url], rating: recipe[:rating])
    puts "Seeding #{recipe[:name]} complete"
end




