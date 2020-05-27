class Message < ApplicationRecord
    belongs_to :from, class_name: "User", foreign_key: "from_id"
    belongs_to :chatroom
    has_many :reactions
    has_many :replies

    def user
        self.from
    end

    def to_or_from
        if self.from_id==@current_user
            return "from"
        end
        return "to"
    end
end
