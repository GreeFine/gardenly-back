class PlantColor < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :plant
  belongs_to :color
end
