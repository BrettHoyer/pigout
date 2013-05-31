# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = ["Philadelphia", "New York", "Washington, DC, San Francisco, Los Angeles, Chicago, Houston, New Orleans, Miami"]
categories = ["Pizza", "Cheesesteaks", "Indian", "Mexican"]

City.destroy_all
cities.each { |city| City.create(name: "#{city}")}

Category.destroy_all
categories.each { |category| Category.create(name: "#{category}")}