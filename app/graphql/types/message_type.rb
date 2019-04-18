module Types
  class MessageType < Types::BaseObject
    description "Message object"
    field :id, ID, null: false
    field :room, Types::RoomType, null: false
    field :user, Types::UserType, null: false
    field :content, String, null: false
  end
end
