module Types
  class MediumType < Types::BaseObject
    description "User object"

    implements Types::ActiveRecordInterface

    field :id, ID, null: false
    field :picture, String, null: false
    field :title, String, null: false
    field :size, Integer, null: false
    field :height, Integer, null: false
    field :width, Integer, null: false
    field :description, String, null: true
  end
end
