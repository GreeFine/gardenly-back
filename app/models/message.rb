class Message < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :user
  belongs_to :room
end
