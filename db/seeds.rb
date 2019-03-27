# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tom = User.create(name: "Tomaz", password: "zamot101", email: "tomaz.r.rodrigues@gmail.com", id: 1, inbox_id: 1)
george = User.create(name: "George", password: "butt", email: "george@gaysex.biz", id: 2, inbox_id: 2)
box1 = Inbox.create(user_id: tom.id)
box2 = Inbox.create(user_id: george.id)

everlast = Joke.new
everlast.setup = "What do you call a guy who's girlfriend cheats on him forever"
everlast.punchline = "Cuck Everlasting"
everlast.author = tom

everlast.save

gang = Joke.create(setup: "La Cosa Nostra", punchline: "Yeah I'm affiliated with that gang")
gang.author = george
gang.save

convo1 = Conversation.new
convo1.inboxes << box1
convo1.inboxes << box2
convo1.save

mess1 = Message.new
mess1.conversation_id = convo1.id
mess1.from_id = george.id
mess1.to_id = tom.id
mess1.subject = "This is a test message"
mess1.content = "This is the content of the test message"
mess2 = Message.new
mess2.conversation_id = convo1.id
mess2.from_id = tom.id
mess2.to_id = george.id
mess2.subject = "This is a test message again"
mess2.content = "This is the content of the test message for a second time"

mess1.save

convo1.messages << mess1

convo1.save
