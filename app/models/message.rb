class Message < ApplicationRecord
    # belongs_to :user
    belongs_to :chatroom
    has_many :reactions
    has_many :replies

end
