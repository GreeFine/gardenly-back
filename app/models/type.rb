class Type < ApplicationRecord
  self.primary_key = :uuid

  has_many :plants
end
