class PlantShape < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :shape
  belongs_to :plant
end
