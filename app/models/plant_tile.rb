class PlantTile < ApplicationRecord
  self.primary_key = :uuid
  attr_accessor :data, :key, :sun_exposition, :age, :tile_id

  belongs_to :plant
  belongs_to :tile
end
