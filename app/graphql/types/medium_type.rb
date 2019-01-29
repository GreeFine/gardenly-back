module Types
  class MediumType < Types::BaseObject
    description "User object"
    field :id, ID, null: false
    field :picture, String, null: false
    field :title, String, null: false
    field :description, String, null: true
  end
end
