class PlantTile < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :plant
  belongs_to :tile
end
