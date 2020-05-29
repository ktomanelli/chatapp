require 'faker'
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
UserChatroom.destroy_all

User.create(name:'Kyle',username:"ktomanelli",password:"k12345",img_url:"https://quiviracoalition.org/wp-content/uploads/2019/02/generic-person-icon-300x300.png")
20.times do 
    User.create(name:Faker::Name.name,username:"#{Faker::Name.initials(number: 1)+Faker::Name.last_name}",password:"#{Faker::Name.initials(number: 1)}12345",img_url:
    Faker::Avatar.image(size: "50x50", format: "jpg"))
end

def get_other(array,val)
    if val==array[0]
        return array[1]
    end
    return array[0]
end

100.times do 
    users=[User.all.sample,User.all.sample]
    if users[0] != users[1]
        c=Chatroom.create(title:"#{users[0].name} + #{users[1].name}")
        u1=users.sample
        u2=get_other(users,u1)
        UserChatroom.create(user_id:u1.id,chatroom_id:c.id)
        UserChatroom.create(user_id:u2.id,chatroom_id:c.id)
        rand(20..50).times do
            u1=users.sample
            u2=get_other(users,u1)
            Message.create(content:Faker::Lorem.sentences(number: 2),from_id:u1.id,to_id:u2.id,chatroom_id:c.id)
        end
    end
end

