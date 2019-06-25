class Tile < ApplicationRecord
  self.primary_key = :uuid
  attr_accessor :data, :key, :name, :ground_type_id

  belongs_to :garden
  belongs_to :ground_type

  has_many :plant_tiles, dependent: :destroy
  has_many :plants, through: :plant_tiles
end
