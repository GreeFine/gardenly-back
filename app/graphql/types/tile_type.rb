module Types
  class TileType < Types::BaseObject
    description "Tile object (parterre)"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false
    field :key, Integer, null: false
    field :data, String, null: false
    field :garden, GardenType, null: false
    field :ground_type, GroundTypeType, null: false
    field :plants, [PlantType], null: false

  end
end
