module Types
  class SessionType < Types::BaseObject
    description "User object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :user, UserType, null: false
  end
end
