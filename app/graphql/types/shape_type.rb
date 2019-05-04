module Types
  class ShapeType < Types::BaseObject
    description "Shape object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false

  end
end
