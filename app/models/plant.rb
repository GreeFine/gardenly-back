class Plant < ApplicationRecord
  self.primary_key = :uuid

  mount_base64_uploader :photo, PhotoUploader

  belongs_to :type

  has_many :plant_ground_types, dependent: :destroy
  has_many :ground_types, through: :plant_ground_types

  has_many :plant_periodicities, dependent: :destroy
  has_many :periodicities, through: :plant_periodicities

  has_many :plant_shapes, dependent: :destroy
  has_many :shapes, through: :plant_shapes
end
