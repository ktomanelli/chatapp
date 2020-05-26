class User < ApplicationRecord
    has_many :messages
    has_many :replies
    has_many :reactions
    has_secure_password


    def inbox
        Message.all
        # Message.all.select do |message|
        #     message.to_id==self.id
        # end
    end
    def sent
        Message.all.select do |message|
            message.from_id==self.id
        end
    end
end
