class PlantGroundType < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :ground_type
  belongs_to :plant
end
