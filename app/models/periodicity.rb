class Periodicity < ApplicationRecord
  self.primary_key = :uuid

  has_many :plant_periodicities, dependent: :destroy
  has_many :plants, through: :plant_periodicities
end
