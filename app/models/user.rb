class User < ApplicationRecord
    has_many :messages
    has_many :replies
    has_many :reactions
    has_many :user_chatrooms
    has_many :chatrooms, through: :user_chatrooms
    has_secure_password


    def inbox
        Message.all.select do |message|
            message.to_id==self.id
        end
    end
    def sent
        Message.all.select do |message|
            message.from_id==self.id
        end
    end
    def messages
       message_array = self.inbox
       message_array.concat(self.sent)
       message_array
    end
end
