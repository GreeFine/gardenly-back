module Types
  class TileType < Types::BaseObject
    description "Tile object (parterre)"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :garden, GardenType, null: false
    field :plants, [PlantType], null: false

  end
end
