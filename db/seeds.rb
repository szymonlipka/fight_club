# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)s
pokemon1 = Pokemon.create( first_name: 'Pika', last_name: 'Chu' )
pokemon2 = Pokemon.create( first_name: 'Snor', last_name: 'Lax' )
pokemon1.skills << Skill.create( name: 'Flying', value: 1 )
pokemon1.skills << Skill.create( name: 'Speed', value: 4 )
pokemon1.skills << Skill.create( name: 'Strength', value: 5 )
pokemon1.skills << Skill.create( name: 'Wisdom', value: 0 )
pokemon1.skills << Skill.create( name: 'Tactics', value: 0 )
pokemon1.skills << Skill.create( name: 'Learning', value: 0 )
pokemon1.skills << Skill.create( name: 'Inference', value: 0 )
pokemon1.skills << Skill.create( name: 'Agility', value: 0 )
pokemon2.skills << Skill.create( name: 'Flying', value: 1 )
pokemon2.skills << Skill.create( name: 'Speed', value: 2 )
pokemon2.skills << Skill.create( name: 'Strength', value: 2 )
pokemon2.skills << Skill.create( name: 'Wisdom', value: 1 )
pokemon2.skills << Skill.create( name: 'Tactics', value: 1 )
pokemon2.skills << Skill.create( name: 'Learning', value: 1 )
pokemon2.skills << Skill.create( name: 'Inference', value: 1 )
pokemon2.skills << Skill.create( name: 'Agility', value: 1 )
