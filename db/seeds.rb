require 'open-uri'
require 'json'

ingredients_api = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = URI.open(ingredients_api).read
parsed_ingredients = JSON.parse(ingredients)

puts "Destroying ingredients..."
Ingredient.destroy_all

puts "Creating new ingredients"
parsed_ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "Created #{Ingredient.count} ingredients!"
