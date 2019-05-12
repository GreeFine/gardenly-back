class Color < ApplicationRecord
  self.primary_key = :uuid

  has_many :plant_colors, dependent: :destroy
  has_many :plants, through: :plant_colors
end
