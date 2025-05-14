# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"

Category.destroy_all
Recipe.destroy_all



# recipes_array = [
# {name: "Carbonara", description: "Egg pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/887637/1280x1280sq70/photo.webp", rating: "4.2"},
# {name: "Macaronni", description: "Cheese pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/4e65ddcc856e052f/1280x1280sq70/photo.webp", rating: "3.5"},
# {name: "Bolognese", description: "Meat pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/0198f729c32d483e/1280x1280sq70/photo.webp", rating: "4.3"},
# {name: "Pesto", description: "Pesto pasta", image_url: "https://img-global-jp.cpcdn.com/recipes/7577758/1280x1280sq70/photo.webp", rating: "3.0"},
# ]

# recipes_array.each do |recipe| 
#     Recipe.create(name: recipe[:name], description: recipe[:description], image_url: recipe[:image_url], rating: recipe[:rating])
#     puts "Seeding recipe: #{recipe[:name]}, complete"
# end

p "Start: Seeding Category"

categories_array = ["Breakfast", "Lunch", "Dinner", "Snack"]

categories_array.each do |category| 
    Category.create(name: category)
    puts "Seeding category: #{category}, complete"
end





def recipe_builder(id)
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
    #p url
    meal_serialized = URI.parse(url).read
    #p meal_serialized
    meal = JSON.parse(meal_serialized)["meals"][0]#(JSON->ArrayOfHash), -> Extract[:meals]_HashKey -> Extract[hash]_FromArray?
    #p meal
    #p meal["strMealThumb"]

    Recipe.create!(
        name: meal["strMeal"],
        description: meal["strInstructions"],
        image_url: meal["strMealThumb"],
        rating: rand(0..5.0).round(1)
    ) 
    puts "Seeding recipe: #{meal["strMeal"]}, complete"
end

p "Start: Seeding Recipe"

categories = ["Breakfast", "Pasta", "Seafood", "Dessert", "Chicken"]
#p categories 

categories.each do |category|
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
    recipe_list = URI.parse(url).read ##stringifies api-data(API -> JSON)
    #p recipe_list
    recipies = JSON.parse(recipe_list) ##array of hash api-data(JSON -> Array of Hash)
    #p recipies

    recipies["meals"].take(5).each do |recipe| ###from hash-api, take only meals: key. Also only take the first 5 entries.
        #p recipe["idMeal"]
        recipe_builder(recipe["idMeal"])
    end
end




