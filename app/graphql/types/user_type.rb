module Types
  class UserType < Types::BaseObject
    description "User object"
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :age, Integer, null: true
  end
end
