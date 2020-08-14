# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
# require 'rest-client'
require 'open-uri'

# response = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
# repos = JSON.parse(response)

puts 'Cleansing Datebase...'
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
ingredient = JSON.parse(ingredients)

ingredient['drinks'].each do |drink|
  i = Ingredient.create(name: drink['strIngredient1'])
  puts "create#{i.name}"
end
puts "finished"
