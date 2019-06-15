class StaticElement < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :garden
end
