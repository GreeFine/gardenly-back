module Types
  class UserType < Types::BaseObject
    puts "\n\n\n\n\n\n\n\nsafdas1111111111111111dasd\n\n\n\n\n\n"

    puts "\n\n\n\n\n\n\n\nsafdas222222222222222dasd\n\n\n\n\n\n"

    description "User object"
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :age, Integer, null: true
  end
end
