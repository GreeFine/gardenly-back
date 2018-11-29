module Types
  class SessionType < Types::BaseObject
    description "User object"
    field :id, ID, null: false
    field :user, UserType, null: false
  end
end
