class Tile < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :garden

  has_many :plant_tiles, dependent: :destroy
  has_many :plants, through: :plant_tiles
end
