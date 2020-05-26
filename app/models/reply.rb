class Reply < ApplicationRecord
    belongs_to :from, class_name: "User", foreign_key: "from_id"
    belongs_to :message
end
