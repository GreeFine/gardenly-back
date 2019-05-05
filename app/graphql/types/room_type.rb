module Types
  class RoomType < Types::BaseObject
    description "Room object"
    field :id, ID, null: false
    field :users, [Types::UserType], null: false
    field :name, String, null: false
    field :messages, [Types::MessageType], null: true
  end
end
