
class Room < ApplicationRecord
  self.primary_key = :uuid

  has_many :messages
  has_and_belongs_to_many :users
end
