module Types
  class StaticElementType < Types::BaseObject
    description "StaticElement object (chair, table...)"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :key, Integer, null: false
    field :data, String, null: false
    field :garden, GardenType, null: false
  end
end
