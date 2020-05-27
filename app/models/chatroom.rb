class Chatroom < ApplicationRecord
    has_many :messages

    def users
        users=[]
        users<<User.find(self.messages.first.from_id)
        users<<User.find(self.messages.first.to_id)
        users
    end
end
