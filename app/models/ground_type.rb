class GroundType < ApplicationRecord
  self.primary_key = :uuid

  has_many :plant_ground_types, dependent: :destroy
  has_many :plants, through: :plant_ground_types

  has_many :tiles
end
