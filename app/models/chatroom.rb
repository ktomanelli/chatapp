class Chatroom < ApplicationRecord
    has_many :messages
    has_many :user_chatrooms
    has_many :users, through: :user_chatrooms

    def self.get_active_user_chatrooms(id)
        UserChatroom.all.select do |user_chatroom|
            user_chatroom.user_id==id
        end
    end

    def self.get_active_chatrooms(id)
        chatroom_ids=Chatroom.get_active_user_chatrooms(id)
        chatroom_ids.map do |user_chatrooms|
            Chatroom.find(user_chatrooms.chatroom_id)
        end
    end

    def get_other_user(user)
        if self.users[0]==user
            return self.users[1]
        end
        return self.users[0]
    end
end
