module Types
  class ColorType < Types::BaseObject
    description "Color object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false

  end
end
