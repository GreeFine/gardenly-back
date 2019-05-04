class Shape < ApplicationRecord
  self.primary_key = :uuid

  has_many :plant_shapes, dependent: :destroy
  has_many :plants, through: :plant_shapes
end
