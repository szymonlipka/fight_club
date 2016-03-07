# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)s
pokemon1 = Pokemon.create( first_name: 'Pika', last_name: 'Chu', learning: 5, inference: 4, agility: 1)
pokemon2 = Pokemon.create( first_name: 'Snor', last_name: 'Lax', flying: 4, speed: 4, strength: 2 )
pokemon1.calculate_battle_points
pokemon2.calculate_battle_points
