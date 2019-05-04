class PlantPeriodicity < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :periodicity
  belongs_to :plant
end
