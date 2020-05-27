class Chatroom < ApplicationRecord
    has_many :messages
    has_many :user_chatrooms
    has_many :users, through: :user_chatrooms

    # def users
    #     users=[]
    #     users<<User.find(self.messages.first.from_id)
    #     users<<User.find(self.messages.first.to_id)
    #     users
    # end


end
