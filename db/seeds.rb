# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Message.destroy_all
Chatroom.destroy_all
Reply.destroy_all
Reaction.destroy_all

ramon = User.create(name:'Ramon',username:'ramon',password:'r12345')
kyle = User.create(name:'Kyle',username:'kyle',password:'k12345')

cr1=Chatroom.create(title:'A Sick Chatroom')

m1 = Message.create(content:'Hey!',from_id:kyle.id,to_id:ramon.id,chatroom_id:cr1.id)
m2 = Message.create(content:'Hello',from_id:ramon.id,to_id:kyle.id,chatroom_id:cr1.id)
m3 = Message.create(content:"what's up?",from_id:kyle.id,to_id:ramon.id,chatroom_id:cr1.id)
m4 = Message.create(content:'nm u?',from_id:ramon.id,to_id:kyle.id,chatroom_id:cr1.id)