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
{name: "Carbonara", description: "Egg pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/887637/1280x1280sq70/photo.webp", rating: "4.2"},
{name: "Macaronni", description: "Cheese-sauce pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/4e65ddcc856e052f/1280x1280sq70/photo.webp", rating: "3.5"},
{name: "Bolognese", description: "Meat-sauce pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/0198f729c32d483e/1280x1280sq70/photo.webp", rating: "4.3"},
{name: "Pesto", description: "Pesto pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/7577758/1280x1280sq70/photo.webp", rating: "3.0"},
]

recipes_array.each do |recipe| 
    Recipe.create(name: recipe[:name], description: recipe[:description], image_url: recipe[:image_url], rating: recipe[:rating])
    puts "Seeding recipe: #{recipe[:name]}, complete"
end

Category.destroy_all

categories_array = [
    {name: "Breakfast"},
    {name: "Lunch"},
    {name: "Dinner"},
    {name: "Snack"}
]

categories_array.each do |category| 
    Category.create(name: category[:name])
    puts "Seeding category: #{category[:name]}, complete"
end





