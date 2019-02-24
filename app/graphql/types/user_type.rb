module Types
  class UserType < Types::BaseObject
    description "User object"
    field :id, ID, null: false
    field :username, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :age, Integer, null: true
    field :address, String, null: true
    field :date_of_birth, String, null: true
    field :phone_number, String, null: true
  end
end
