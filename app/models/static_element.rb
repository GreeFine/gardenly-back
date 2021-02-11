class StaticElement < ApplicationRecord
  self.primary_key = :uuid
  attr_accessor :data, :key
  belongs_to :garden
end
