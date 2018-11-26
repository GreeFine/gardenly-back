# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do |i|
  User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, age: rand(100))
end

Plant.create!(name: "Adam's Needle Yucca")
Plant.create!(name: "Adonis")
Plant.create!(name: "Alberta Spruce, Dwarf")
Plant.create!(name: "Almond, Flowering")
Plant.create!(name: "Aloe Vera")
Plant.create!(name: "Alyssum, Sweet")
Plant.create!(name: "Alyssum, Yellow")
Plant.create!(name: "Ambassador Allium")
Plant.create!(name: "Angelina Stonecrop")
Plant.create!(name: "Apple Trees (Introduction)")
Plant.create!(name: "Arctic Beauty Kiwi")
Plant.create!(name: "Arborvitae, Emerald Green")
Plant.create!(name: "Arborvitae, North Pole")
Plant.create!(name: "Arrowwood Viburnum")
Plant.create!(name: "Ash Trees")
Plant.create!(name: "Aspen Trees, Quaking")
Plant.create!(name: "Autumn Blaze Maple")
Plant.create!(name: "Autumn Clematis, Sweet")
Plant.create!(name: "Autumn Joy Sedum")
Plant.create!(name: "Avens")
Plant.create!(name: "Azaleas (Introduction)")
Plant.create!(name: "Azalea, Gibraltar")
Plant.create!(name: "Azalea, Golden Oriole")
Plant.create!(name: "Azalea, Stewartstonian")
