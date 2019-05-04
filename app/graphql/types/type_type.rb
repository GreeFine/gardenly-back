module Types
  class TypeType < Types::BaseObject
    description "Type object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false

  end
end
