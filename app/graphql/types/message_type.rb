# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    description 'Message object'
    implements Types::ActiveRecordInterface
    field :room, Types::RoomType, null: false
    field :user, Types::UserType, null: false
    field :content, String, null: false
  end
end
