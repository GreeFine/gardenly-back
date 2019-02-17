module Types
  class UserType < Types::BaseObject
    description "User object"
    field :id, ID, null: false
    field :username, String, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :age, Integer, null: true
    field :address, String, null: true
    field :date_of_birth, String, null: true
    field :phone_number, String, null: true
    field :gardens, [Types::GardenType], null: false
  end
end
