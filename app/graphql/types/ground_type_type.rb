module Types
  class GroundTypeType < Types::BaseObject
    description "GroundType object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false

  end
end
