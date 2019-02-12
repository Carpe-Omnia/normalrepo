# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
everlast = Joke.new 
everlast.setup = "What do you call a guy who's girlfriend cheats on him forever" 
everlast.punchline = "Cuck Everlasting" 
everlast.save 
gang = Joke.create(setup: "La Cosa Nostra", punchline: "Yeah I'm affiliated with that gang") 
