# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
require 'open-uri'
require 'json'

puts "Starts"

Ingredient.delete_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
obj = JSON.parse(json)
data = []


obj["drinks"].each  do |d|
  object = {
    name: d["strIngredient1"]
  }
  data << object
end
Ingredient.create!(data)

puts "Done"
