class Chatroom < ApplicationRecord
    has_many :messages
    has_many :user_chatrooms
    has_many :users, through: :user_chatrooms

    def self.get_active_user_chatrooms
        UserChatroom.all.select do |user_chatroom|
            user_chatroom.user_id==@current_user
        end
    end

    def self.get_active_chatrooms
        chatroom_ids=Chatroom.get_active_user_chatrooms
        chatroom_ids.map do |user_chatrooms|
            Chatroom.find(user_chatrooms.chatroom_id)
        end
    end
end
