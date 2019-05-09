class Task < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :garden
  belongs_to :user
  belongs_to :plant_tile
  STATUSES = [
    "New",
    "Done"
  ]
end
