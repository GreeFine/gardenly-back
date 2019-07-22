module Types
  class PlantTileType < Types::BaseObject
    description "PlantTile object (relation parterre-plante, contient la plante et le parterre sur lequel elle est)"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :key, Integer, null: false
    field :plant, PlantType, null: false
    field :tile, TileType, null: false
    field :age, Integer, null: true
    field :sun_exposition, Float, null: true
    field :data, String, null: false
  end
end
