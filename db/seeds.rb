# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)s
pokemon1 = Pokemon.new( first_name: 'Pika', last_name: 'Chu' )
pokemon2 = Pokemon.new( first_name: 'Snor', last_name: 'Lax' )
pokemon1.save
pokemon2.save
pokemon1.calculate_battle_points
pokemon2.calculate_battle_points
